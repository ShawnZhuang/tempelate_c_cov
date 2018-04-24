#!/bin/bash

# seting default various
PROG=${PROG:-${1}}

# testcases
./${PROG}
./${PROG} 1
./${PROG} 2