.PHONY: run clean

target = ./bin/jshell

all: target
	

target: ./source/jshell.c
	gcc ./source/jshell.c -o ./bin/jshell

run: target
	./bin/jshell

clean:
	rm -f ./bin/*