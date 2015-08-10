-- ========================================
-- [Problem 2]
-- ========================================
-- https://projecteuler.net/problem=2
-- ========================================

fib s a b
    | (b >= 4000000)   = s
    | ((mod b 2) == 0) = fib (s+b) (a+b) a 
    | otherwise        = fib s (a+b) a

main = print (fib 0 2 1)

-- answer = 4613732

