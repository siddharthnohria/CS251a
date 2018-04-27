#set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set terminal postscript eps enhanced color

set key samplen 2 spacing 1.5 font ",22"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"

set xlabel "Size"
set ylabel "Average time in microsecs"
set xrange[10:10000000]
set logscale x
set ytic auto
set xtic auto

set key bottom right

set output "averageplot.eps"
plot 'average.txt' every ::0::3 using 2:3 title "Threads 1" with linespoints lc "black", \
     '' every ::4::7 using 2:3 title "Threads 2" with linespoints lc "red",\
     '' every ::8::11 using 2:3 title "Threads 4" with linespoints lc "blue", \
     '' every ::12::15 using 2:3 title "Threads 8" with linespoints lc "green", \
     '' every ::16::19 using 2:3 title "Threads 16" with linespoints lc "yellow", \

