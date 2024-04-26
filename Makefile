.PHONY := build build-test

build:
	@as -o libsad.so src/main.s

build-test:
	@as -o test/test.o test/test.s
	@ld -o test/test -l sad test/test.o
