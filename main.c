#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
	int dev;
	char temp;

	if (argc <= 1) {
		printf("No args\n");
		return -1;
	}

	dev = open("/dev/sm9s5422_perivib", O_WRONLY);

	temp = atoi(argv[1]);
	write(dev, &temp, 1);
	close(dev);

	return 0;
}
