CC= gcc

controller: controller.o
	$(CC) -pthread -o controller controller.o -lpigpio -lrt
