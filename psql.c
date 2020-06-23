#include <stdio.h>
#include <stdlib.h>
#include "psql.h"


void exit_nicely(PGconn *conn)
{
  PQfinish(conn);
  exit(1);
}

PGconn *initdb()
{
  const char *conninfo;
  PGconn     *conn;
  PGresult   *res;


  /*
   * If the user supplies a parameter on the command line, use it as the
   * conninfo string; otherwise default to setting dbname=postgres and using
   * environment variables or defaults for all other connection parameters.
   */
  conninfo = "host=server.aio-net.com user=smpentecost dbname=home";

  /* Make a connection to the database */
  conn = PQconnectdb(conninfo);

  /* Check to see that the backend connection was successfully made */
  if (PQstatus(conn) != CONNECTION_OK)
    {
      fprintf(stderr, "Connection to database failed: %s",
	      PQerrorMessage(conn));
      exit_nicely(conn);
    }

  /* Set always-secure search path, so malicious users can't take control. */
  res = PQexec(conn,
	       "SELECT pg_catalog.set_config('search_path', 'bbq', false)");
  if (PQresultStatus(res) != PGRES_TUPLES_OK)
    {
      fprintf(stderr, "SET failed: %s", PQerrorMessage(conn));
      PQclear(res);
      exit_nicely(conn);
    }

  /*
   * Should PQclear PGresult whenever it is no longer needed to avoid memory
   * leaks
   */
  PQclear(res);

  return conn;
}

int sendTransaction(PGconn *conn, char s[])
{
  /*
   * Our test case here involves using a cursor, for which we must be inside
   * a transaction block.  We could do the whole thing with a single
   * PQexec() of "select * from pg_database", but that's too trivial to make
   * a good example.
   */
  PGresult   *res;
  int         nFields;
  int         i, j;

  /* Start a transaction block */
  res = PQexec(conn, "BEGIN");
  if (PQresultStatus(res) != PGRES_COMMAND_OK)
    {
      fprintf(stderr, "BEGIN command failed: %s", PQerrorMessage(conn));
      PQclear(res);
      exit_nicely(conn);
    }
  PQclear(res);

  /*
   * Fetch rows from pg_database, the system catalog of databases
   */
  res = PQexec(conn, "DECLARE myportal CURSOR FOR select * from home");
  if (PQresultStatus(res) != PGRES_COMMAND_OK)
    {
      fprintf(stderr, "DECLARE CURSOR failed: %s", PQerrorMessage(conn));
      PQclear(res);
      exit_nicely(conn);
    }
  PQclear(res);

  res = PQexec(conn, "FETCH ALL in myportal");
  if (PQresultStatus(res) != PGRES_TUPLES_OK)
    {
      fprintf(stderr, "FETCH ALL failed: %s", PQerrorMessage(conn));
      PQclear(res);
      exit_nicely(conn);
    }

  /* first, print out the attribute names */
  nFields = PQnfields(res);
  for (i = 0; i < nFields; i++)
    printf("%-15s", PQfname(res, i));
  printf("\n\n");

  /* next, print out the rows */
  for (i = 0; i < PQntuples(res); i++)
    {
      for (j = 0; j < nFields; j++)
	printf("%-15s", PQgetvalue(res, i, j));
      printf("\n");
    }

  PQclear(res);
  
  /* close the portal ... we don't bother to check for errors ... */
  res = PQexec(conn, "CLOSE myportal");
  PQclear(res);

  /* end the transaction */
  res = PQexec(conn, "END");
  PQclear(res);
}