-- ========================================
-- [Problem 1]
-- ========================================
-- https://projecteuler.net/problem=1
-- ========================================

main = print ((\n -> (sum (filter (\e -> ((mod e 3) == 0) || ((mod e 5) == 0)) [0..(n-1)]))) 1000)

-- answer = 233168

-- judge n
--     | ((mod n 3) == 0) = n
--     | ((mod n 5) == 0) = n
--     | otherwise        = 0

-- mySum n a
--     | n == 0     = a
--     | n > 0      = mySum (n-1) ((judge n) + a)
--     | otherwise  = error "[Error] mySum"

-- main = print ((\n -> mySum (n-1) 0) 1000)

