CC= gcc
CFLAGS=-I/usr/include/postgresql
CPPFLAGS += -I/usr/include/postgresql
DEPS=controller.h psql.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

controller: main.o controller.o psql.o
	$(CC) -pthread -o controller controller.o psql.o main.o -lpigpio -lrt -L/usr/include/postgresql -lpq
