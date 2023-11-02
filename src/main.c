#include <stdint.h>
#include <stdio.h>

__uint128_t a = 0;

extern __uint128_t owo();

int main() {
	a = owo();
	long long * x = (long long *) &a;
	printf("%0lx%lx\n", x[0], x[1]);
	return 0;
}
