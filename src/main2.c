#include <stdint.h>
#include <stdio.h>

__uint128_t x = 0;

extern __uint128_t uwu(long long n);

int main() {
	x = uwu(51);
	long long * p = (long long *) &x;
	printf("%0lx%lx\n", p[1], p[0]);
	return 0;
}
