#include <stdio.h>
#include <stdlib.h>
#include "psql.h"


static int beginTransaction(PGconn *conn)
{
  PGresult   *res;

  res = PQexec(conn, "BEGIN");
  if (PQresultStatus(res) != PGRES_COMMAND_OK)
    {
      fprintf(stderr, "BEGIN command failed: %s", PQerrorMessage(conn));
      PQclear(res);
      exit_nicely(conn);
      return -1;
    }
  PQclear(res);

  return 0;
}


static void endTransaction(PGconn *conn)
{
  PGresult   *res;

  res = PQexec(conn, "END");
  PQclear(res);
}

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

  conninfo = "host=server.aio-net.com user=smpentecost dbname=home";
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

  PQclear(res);

  return conn;
}

int sendTemperatures(PGconn *conn, float temp1, float temp2)
{
  PGresult   *res;
  char sql[160];

  if(!beginTransaction(conn)){
    sprintf(sql, "INSERT INTO bbq.temperatures (temp1, temp2) VALUES (%f, %f);", temp1, temp2);
    res = PQexec(conn, sql);
    PQclear(res);
  };
  endTransaction(conn);

  return 0;
}

int getTemperatures(PGconn * conn)
{
  PGresult   *res;
  int         nFields;
  int         i, j;

  if (!beginTransaction(conn)){

    res = PQexec(conn, "DECLARE myportal CURSOR FOR select * from bbq.temperatures");
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
  }
  endTransaction(conn);

  return 0;
}
