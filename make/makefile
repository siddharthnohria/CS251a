App: thread_function.o prog.o
	gcc -I. -o App thread_function.o prog.o -lpthread -lm

thread_function.o: thread_function.c common.h
	gcc -I. -c  thread_function.c -o thread_function.o -lm

prog.o: prog.c common.h
	gcc -I. -c prog.c -o prog.o -lm

runtest: App script.sh
	rm -f runtest
	./script.sh
 
analyse: runtest avg.sh var.sh speed.py average.txt variance.txt speed.txt

average.txt: runtest avg.sh
	./avg.sh > average.txt
variance.txt: runtest var.sh
	./var.sh > variance.txt
speed.txt: runtest speed.py
	python speed.py > speed.txt

plot: scatter1.eps scatter2.eps scatter3.eps scatter4.eps scatter5.eps averageplot.eps speedup_color.eps speedup_errorbar.eps

scatter1.eps: average.txt scatter.p
	gnuplot scatter.p
scatter2.eps: average.txt scatter.p
	gnuplot scatter.p
scatter3.eps: average.txt scatter.p
	gnuplot scatter.p
scatter4.eps: average.txt scatter.p
	gnuplot scatter.p
scatter5.eps: average.txt scatter.p
	gnuplot scatter.p
averageplot.eps: average.txt lineplot.p
	gnuplot lineplot.p
speedup_color.eps: speed.txt plot_speedup.p
	gnuplot plot_speedup.p
speedup_errorbar.eps: variance.txt speed.txt plot_speedup.p
	gnuplot plot_speedup.p

report: report.pdf report.tex
report.pdf: report.tex scatter1.eps scatter2.eps scatter3.eps scatter4.eps scatter5.eps averageplot.eps speedup_color.eps speedup_errorbar.eps
	pdflatex report.tex
	
clean:
	rm -f *.o App 
	rm -f average.txt runtest variance.txt speed.txt makevar.txt 
	rm -f scatter1.eps scatter2.eps scatter3.eps scatter4.eps scatter5.eps 
	rm -f averageplot.eps speedup_color.eps speedup_errorbar.eps
	rm -f *.pdf *.aux *.log
