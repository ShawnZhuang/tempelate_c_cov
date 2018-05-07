# included by makefile and shell files
PROG=main
MAKEFLAGS=--no-print-directory

MAKE=make
CC =gcc

CFLAGS +=-fprofile-arcs -ftest-coverage
AR=ar 
ARFLAGS = -r