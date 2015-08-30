# Makefile for lab6

TARGETS =   Producer Consumer

AFILES  =   Producer.asm Consumer.asm
OBJS    =   $(AFILES:.asm=.o)
LFLAGS  =   -lcosc2425

all:    $(TARGETS)

%:      %.o
		gcc $< -o $@ $(LFLAGS)

%.o:    %.asm
		nasm -f elf64 -Fdwarf -g $< -o $@

clean:
		rm -f $(OBJS) $(TARGETS)
