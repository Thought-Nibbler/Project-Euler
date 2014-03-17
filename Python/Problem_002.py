# -*- coding: utf-8 -*-

prev = [1, 2];
sum  = 2;
now  = 0;

while (now <= 4000000):
    now     = prev[0] + prev[1];
    prev[0] = prev[1];
    prev[1] = now;
    if (now % 2) == 0:
        sum += now;

print sum;

       
