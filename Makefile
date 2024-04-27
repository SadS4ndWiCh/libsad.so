.PHONY := build

build:
	@as -o libsad.so src/main.s

test_%: test/test_%.s
	@as -o test/test_$*.o test/test_$*.s
	@ld -o test/test_$* -l sad test/test_$*.o
	@rm -fr test/test_$*.o
