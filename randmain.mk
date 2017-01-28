
randlibsw.so: randlibsw.o
	gcc -shared -o randlibsw.so randlibsw.o
randlibhw.so: randlibhw.o
	gcc -shared -o randlibhw.so randlibhw.o
randlibhw.o: randlibhw.c randlib.h
	gcc -mrdrnd -Wall -fPIC -c randlibhw.c
randlibsw.o: randlibsw.c randlib.h
	gcc -Wall -fPIC -c randlibsw.c
randcpuid.o: randcpuid.c
	gcc -c randcpuid.c
randmain.o: randmain.c
	gcc -c randmain.c
randmain: randmain.o randcpuid.o
	gcc -ldl -Wl,-rpath=$PWD -o randmain randmain.o randcpuid.o
