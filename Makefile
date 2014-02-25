# for 32 but machines use:
# CC = g++ -O3
CC = g++ -arch x86_64 -O3

all: test ttlgen

clean:
	rm -f *.o ttlgen test

test: test.o labels.o mathutils.o roman.o
	${CC} -o test test.o labels.o mathutils.o roman.o

ttlgen: ttlgen.o labels.o mathutils.o roman.o
	${CC} -o ttlgen ttlgen.o labels.o mathutils.o roman.o

labels.o: labels.cc labels.h
	${CC} -o labels.o labels.cc -c

ttlgen.o: ttlgen.cc labels.h mathutils.h roman.h
	${CC} -o ttlgen.o ttlgen.cc -c

test.o: test.cc labels.h mathutils.h roman.h
	${CC} -o test.o test.cc -c

mathutils.o: mathutils.cc mathutils.h
	${CC} -o mathutils.o mathutils.cc -c

roman.o: roman.cc roman.h
	${CC} -o roman.o roman.cc -c

