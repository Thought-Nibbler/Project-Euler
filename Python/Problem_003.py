# -*- coding: utf-8 -*-
import math

def isPrime(n):
    sqrt_n = int(math.floor(math.sqrt(n)));
    for i in range(sqrt_n, 2, -1):
        if (n%i) == 0:
            return False;
    return True;

n      = 600851475143;
sqrt_n = int(math.floor(math.sqrt(n)));

for i in range(sqrt_n, 2, -1):
    if ((n%i) == 0) and (isPrime(i)):
        print i;
        break;




       
