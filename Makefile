CXXFLAGS+=-Wall -Wextra -Weffc++ -I/usr/lib64/blitz/include -Os -g
LDFLAGS+=-lutil -lboost_iostreams -lboost_system -lboost_filesystem

all: examples
	@echo "Now type 'make blitz' if you have blitz installed, and 'make interactive' if you system has PTY support."

blitz: examples-blitz

interactive: examples-interactive

everything: examples examples-blitz examples-interactive

clean:
	rm -f *.o
	rm -f examples examples-blitz examples-interactive
	rm -f my_graph_*.png

lint:
	cpplint.py --filter=-whitespace,-readability/streams,-build/header_guard gnuplot-iostream.h

cppcheck:
	cppcheck *.cc *.h --template gcc --enable=all -q

*.o: gnuplot-iostream.h
