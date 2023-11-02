all: owo.ll main.c
	$(LLC) --filetype=obj -O0 -mtriple=$(TGT) -o owo.o owo.ll
	$(CC) -O0 -o tst main.c owo.o -static

clean:
	rm owo.o tst

test:
	$(QEMU_STATIC) tst
