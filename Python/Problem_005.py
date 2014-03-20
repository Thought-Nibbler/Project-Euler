# -*- coding: utf-8 -*-
import math

def isPrime(n):
    sqrt_n = int(math.floor(math.sqrt(n)));
    for i in range(sqrt_n, 1, -1):
        if (n%i) == 0:
            return False;
    return True;

def checkDivisible(n, array):
    for i in array:
        if n%i != 0:
            return False;
    return True;

size = 20;

result = 1;
for i in range(1,size+1):
    result *= i;

primes = [];
for i in range(2,size+1):
    if isPrime(i):
        primes.append(i);

while True:
    div = 1;
    for p in primes:
        if checkDivisible(result/p, range(size,1,-1)):
            div *= p;
    if div == 1:
        print result;
        break;
    result /= div;



