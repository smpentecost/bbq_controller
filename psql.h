#include "libpq-fe.h"

#define DATABASE "home"

PGconn * initdb();

int sendTemperatures(PGconn *conn, float temp1, float temp2);

int getTemperatures(PGconn *conn);

void exit_nicely(PGconn *conn);
