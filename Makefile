include cfg.mk
PRO_DIR=$(shell pwd)
CFLAGS +=-I${PRO_DIR}/include
export CFLAGS
COBJFILE = main.o
# CC =gcc


PROG ?= main
WEB_BROWSER?=firefox
SUBDIR := module 

.PHONY:tc clean GCOV LCOV ${SUBDIR} ${PROG}
.IGNORE:clean
.SILENT:clean

all:${PROG}
	@for dir in ${SUBDIR}; do\
		${MAKE} -C $${dir} $@; done

${PROG}:${COBJFILE}
	@${CC} ${CFLAGS} $< -o $@


${COBJFILE}: *.c
	@${CC} ${CFLAGS} -c $< -o $@ 





## GOV temp files
COV_INFO?=cov.info
RESULT=reports/result_`date +%Y%m%d`

tc:${PROG}
	sh testcase.sh ${PROG}

GCOV:tc
	gcov *.c
LCOV:GCOV 
	lcov -d ./ -b ./ -c -o ${COV_INFO}
	genhtml ${COV_INFO} -o ${RESULT}
	@echo "see ${RESULT}/index.html"
#@${WEB_BROWSER} ${RESULT}/index.html

clean:
	-@rm ${COBJFILE} ${PROG} 
	-@rm *.gcno *.gcda ${COV_INFO} 
	-@rm -r ${RESULT}
	@ for dir in ${SUBDIR}; do\
		${MAKE} -C $${dir} $@;\
	done


module:
	@${MAKE} -C $@ LCOV COV=y

