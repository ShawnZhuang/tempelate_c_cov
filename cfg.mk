# included by makefile and shell files

PRO_DIR:=$(shell dirname $(abspath $(lastword $(MAKEFILE_LIST) )))
# $(shell pwd)

CFLAGS +=-I${PRO_DIR}/include
export CFLAGS

PROG=main
MAKEFLAGS=--no-print-directory

MAKE=make
CC =gcc

CFLAGS +=-fprofile-arcs -ftest-coverage
AR=ar 
ARFLAGS = -r