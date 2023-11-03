.SUFFIXES:
.PHONY: all clean test owo uwu

all: owo uwu

owo.ll.o: owo.ll
	$(LLC) --filetype=obj -O0 -mtriple=$(TGT) -o owo.ll.o owo.ll

uwu.ll.o: uwu.ll
	$(LLC) --filetype=obj -O0 -mtriple=$(TGT) -o uwu.ll.o uwu.ll

owo: owo.ll.o main.c
	$(CC) -O0 -o owo main.c owo.ll.o -static

uwu: uwu.ll.o main2.c
	$(CC) -O0 -o uwu main2.c uwu.ll.o -static

clean:
	@rm -f ./owo ./uwu ./owo.ll.o ./uwu.ll.o

test: owo uwu
	@echo "Running owo"
	@$(QEMU_STATIC) ./owo
	@echo "Running uwu"
	@$(QEMU_STATIC) ./uwu

