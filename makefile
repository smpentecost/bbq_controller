CC= gcc
CFLAGS=-I.
DEPS=controller.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

controller: main.o controller.o
	$(CC) -pthread -o controller controller.o main.o -lpigpio -lrt
