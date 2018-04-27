#!/bin/bash

awk '{ if (NR <=100) sum += $6; } END { if (NR > 0) print 1,1000,sum / 100 }' runtest
awk '{ if (NR>100 && NR <=200) sum += $6; } END { if (NR > 0) print 1,10000,sum / 100 }' runtest
awk '{ if (NR>200 && NR <=300) sum += $6; } END { if (NR > 0) print 1,100000,sum / 100 }' runtest
awk '{ if (NR>300 && NR <=400) sum += $6; } END { if (NR > 0) print 1,1000000,sum / 100 }' runtest
awk '{ if (NR>400 && NR <=500) sum += $6; } END { if (NR > 0) print 2,1000,sum / 100 }' runtest
awk '{ if (NR>500 && NR <=600) sum += $6; } END { if (NR > 0) print 2,10000,sum / 100 }' runtest
awk '{ if (NR>600 && NR <=700) sum += $6; } END { if (NR > 0) print 2,100000,sum / 100 }' runtest
awk '{ if (NR>700 && NR <=800) sum += $6; } END { if (NR > 0) print 2,1000000,sum / 100 }' runtest
awk '{ if (NR>800 && NR <=900) sum += $6; } END { if (NR > 0) print 4,1000,sum / 100 }' runtest
awk '{ if (NR>900 && NR <=1000) sum += $6; } END { if (NR > 0) print 4,10000,sum / 100 }' runtest
awk '{ if (NR>1000 && NR <=1100) sum += $6; } END { if (NR > 0) print 4,100000,sum / 100 }' runtest
awk '{ if (NR>1100 && NR <=1200) sum += $6; } END { if (NR > 0) print 4,1000000,sum / 100 }' runtest
awk '{ if (NR>1200 && NR <=1300) sum += $6; } END { if (NR > 0) print 8,1000,sum / 100 }' runtest
awk '{ if (NR>1300 && NR <=1400) sum += $6; } END { if (NR > 0) print 8,10000,sum / 100 }' runtest
awk '{ if (NR>1400 && NR <=1500) sum += $6; } END { if (NR > 0) print 8,100000,sum / 100 }' runtest
awk '{ if (NR>1500 && NR <=1600) sum += $6; } END { if (NR > 0) print 8,1000000,sum / 100 }' runtest
awk '{ if (NR>1600 && NR <=1700) sum += $6; } END { if (NR > 0) print 16,1000,sum / 100 }' runtest
awk '{ if (NR>1700 && NR <=1800) sum += $6; } END { if (NR > 0) print 16,10000,sum / 100 }' runtest
awk '{ if (NR>1800 && NR <=1900) sum += $6; } END { if (NR > 0) print 16,100000,sum / 100 }' runtest
awk '{ if (NR>1900 && NR <=2000) sum += $6; } END { if (NR > 0) print 16,1000000,sum / 100 }' runtest

