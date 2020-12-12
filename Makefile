hello: hello.o
	ld hello.o -o hello

hello.o: hello.asm
	nasm hello.asm -o hello.o

clean:
	rm -f hello.o hello
