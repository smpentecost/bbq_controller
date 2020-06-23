#include "libpq-fe.h"

#define DATABASE "home"

PGconn * initdb();

void exit_nicely(PGconn *conn);
