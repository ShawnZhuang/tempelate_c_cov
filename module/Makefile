include ../cfg.mk
PROG = test
COBJFILE=module.o
SOBJFILE =
LIB=lib_module.a
# CFLAGS ?=-fprofile-arcs -ftest-coverage

COV_INFO?=cov.info
.PHONY:all exe tc clean GCOV LCOV ${PROG}
.IGNORE:clean
.SILENT:clean


ifeq (${COV},y)
COBJFILE +=main.o
all: ${PROG}

${PROG}:*.c
	${CC}  ${CFLAGS} $^ -o $@
else
all:${LIB}
endif 

${LIB}:${COBJFILE} 
	@$(AR) ${ARFLAGS} $@ $< 

${COBJFILE}: *.c
	@${CC} ${CFLAGS} -c $< -o $@ 


.PHONY:exe tc clean GCOV LCOV



## GOV temp files
ifeq (${COV},y)

RESULT=reports/result_`date +%Y%m%d`
tc:${PROG}
	./$<

GCOV:tc
	gcov *.c

LCOV:GCOV 
	lcov -d ./ -b ./ -c -o ${COV_INFO}
	genhtml ${COV_INFO} -o ${RESULT}
	@echo "see ${RESULT}/index.html"
#@${WEB_BROWSER} ${RESULT}/index.html


endif


clean:
	-@rm  ${COBJFILE} *.a *.o
	-@rm  ${PROG} 
	-@rm ${COV_INFO} *.gcno *.gcda 
	-@rm -r ${RESULT}