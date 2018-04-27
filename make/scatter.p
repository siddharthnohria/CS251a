set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set terminal postscript eps enhanced color

set key samplen 2 spacing 1 font ",22"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"
set logscale x
set logscale y

set xlabel "Size"
set ylabel "Time in mircosecs"
set yrange[10:100000]
set xrange[10:10000000]
set ytic auto
set xtic auto


set output "scatter1.eps"
set title "Threads 1" 
plot 'runtest' every ::0::399 using 1:6 notitle with points pt 1 ps 1.5 lc "blue"

set output "scatter2.eps"
set title "Threads 2" 
plot 'runtest' every ::400::799 using 1:6 notitle with points pt 1 ps 1.5 lc "red"

set output "scatter3.eps"
set title "Threads 4" 
plot 'runtest' every ::800::1199 using 1:6 notitle with points pt 1 ps 1.5 lc "green"

set output "scatter4.eps"
set title "Threads 8" 
plot 'runtest' every ::1200::1599 using 1:6 notitle with points pt 1 ps 1.5 lc "yellow"

set output "scatter5.eps"
set title "threads 16" 
plot 'runtest' every ::1600::1999 using 1:6 notitle with points pt 1 ps 1.5 lc "black"