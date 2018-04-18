#!/bin/bash

. ./sys.cfg

# seting default various
PROG=${PROG:-main}

# testcases
./${PROG}
./${PROG} 1
./${PROG} 2