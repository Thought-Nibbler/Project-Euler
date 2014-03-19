# -*- coding: utf-8 -*-

def isPalindrome(str):
    if len(str) == 0:
        return True;
    if len(str) == 1:
        return True;
    if len(str) == 2:
        return (str[0] == str[1]);
    if str[0] == str[-1]:
        return isPalindrome(str[1:-1]);
    
    return False;

result = 0;

for i in range(999, 100, -1):
    for j in range(999, 100, -1):
        n = i*j;
        if (n > result) and (isPalindrome(str(n))):
            result = n;
            break;

print result;
       
