COBJFILE = main.o
CC =gcc
CFLAGS=-fprofile-arcs -ftest-coverage

PROG ?= main


all:${PROG}

${PROG}:${COBJFILE}
	@${CC} ${CFLAGS} $< -o $@

${COBJFILE}: *.c
	@${CC} ${CFLAGS} -c $< -o $@ 


.PHONY:exe tc clean GCOV LCOV



## GOV temp files
COV_INFO?=cov.info
RESULT=reports/result_`date +%Y%m%d`

tc:${PROG}
	sh testcase.sh

GCOV:tc
	gcov *.c
LCOV:GCOV 
	lcov -d ./ -b ./ -c -o ${COV_INFO}
	genhtml ${COV_INFO} -o ${RESULT}
	echo see ${RESULT}/index.html

clean:
	-@rm ${COBJFILE} ${PROG} 
	-@rm *.gcno *.gcda ${COV_INFO} 
	-@rm -r ${RESULT}
