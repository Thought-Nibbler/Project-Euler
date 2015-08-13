-- ========================================
-- [Problem 5]
-- ========================================
-- https://projecteuler.net/problem=5
-- ========================================

import Data.List

-- g(f) = f(g(f)) => 「g は y コンビネータ」である
y x = x (y x)

-- プログラム内で使う整数集合
integers = [1..20]

-- 整数として評価される除算（結果も整数）
intDiv num denom = floor ((fromIntegral num) / (fromIntegral denom))

-- 素数判定
x1 = \f i n -> case (i, n) of
                 _ | n <= 1         -> False
                   | n == 2         -> True
                   | (mod n 2) == 0 -> False
                   | (i*i) > n      -> True
                   | (mod n i) == 0 -> False
                   | otherwise      -> f (i+2) n
isPrime n = ((y x1) 3) n

-- 素数リスト
primeList = filter isPrime integers

-- 素因数分解 ex.) factors 20 => [[2,2],[5]]
x2 = \g f p n -> case (f, p, n) of
                 _ | (n == 1)                -> f
                   | ((mod n (last p)) == 0) -> g ((last p):f) p (intDiv n (last p)) 
                   | otherwise               -> g f (init p) n
factors n = group (((y x2) [] primeList) n)

-- 素因数の総乗 ex.) productFactors [[2,2],[5]] => 20
productFactors = product . concat


-- 条件「整数集合の全てで割り切れる」が維持できているか判定する
judgeCondition f = null (filter (\e -> (mod (productFactors f) e) /= 0) integers)

-- 条件「整数集合の全てで割り切れる」を満たしたまま、余分に掛けられている素因数を取り除く
reduceStep i x = (take i x) ++ ((tail (x !! i)) : (drop (i+1) x))
x3 = \f i x -> case (i, x) of
                 _ | i >= (length x)                                              -> x
                   | ((length (x !! i)) > 0) && (judgeCondition (reduceStep i x)) -> f i (reduceStep i x)
                   | otherwise                                                    -> f (i+1) x
reduceFactor x = ((y x3) 0) x


-- 初期状態として、整数集合の要素を全て掛けあわせた値の素因数分解表現をもつ
initFactorList = (factors . product) integers
-- 条件「整数集合の全てで割り切れる」を維持したまま、余分な素因数を全て取り除いた素因数分解表現
reducedFactorList = reduceFactor initFactorList


main = (print . productFactors) reducedFactorList

-- answer = 232792560

