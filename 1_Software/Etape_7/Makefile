CC=g++
LDFLAGS=-lm
EXEC=main
SRC=./src/main.cpp ./src/pgcd.cpp

OBJ= $(SRC:.cpp=.o)

CFLAGS=-O2 -Wall

all: $(EXEC)

main: $(OBJ)
	$(CC) $(CFLAGS) -o ./bin/$@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) -o $@ -c $< $(CFLAGS)

.PHONY: clean mrproper

clean: 
	find . -name *.o -delete

mrproper: clean
	rm $(EXEC)
