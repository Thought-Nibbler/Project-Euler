-- ========================================
-- [Problem 5]
-- ========================================
-- https://projecteuler.net/problem=5
-- ========================================

import Data.List

-- g(f) = f(g(f)) => g is y converter
y x = x (y x)

-- プログラム内で使う整数集合
integers = [1..20]

-- 整数として評価される除算（結果も整数）
intDiv num denom = floor ((fromIntegral num) / (fromIntegral denom))

-- 条件「整数集合の全てで割り切れる」が維持できているか判定する
judgeCondition f = null (filter (\e -> (mod (product (concat f)) e) /= 0) integers)

-- 素数判定
x1 = \f i n ->
    if      (n <= 1)         then False
    else if (n == 2)         then True
    else if ((mod n 2) == 0) then False
    else if ((i*i) >= n)     then True
    else if ((mod n i) == 0) then False
    else                          f (i+2) n
isPrime n = ((y x1) 3) n

-- 素数リスト
primeList = filter isPrime integers

-- 素因数分解
x2 = \g f p n ->
        if (n == 1) then f
        else if (mod n (last p) == 0) then g ((last p):f) p (intDiv n (last p)) 
        else g f (init p) n
factors n = ((y x2) [] primeList) n
-- factors n f p
--         | (n == 1) = f
--         | (mod n (last p) == 0) = factors (intDiv n (last p)) ((last p):f) p
--         | otherwise = factors n f (init p)



-- 余分に掛けられている素因数を取り除く
reduceStep i x = (take i x) ++ ((tail (x !! i)) : (drop (i+1) x))
x3 = \f i x ->
     if      (i >= (length x)) then x
     else if (((length (x !! i)) > 1) && (judgeCondition (reduceStep i x))) then f i (reduceStep i x)
     else f (i+1) x
reduceFactor x = ((y x3) 0) x
-- reduceFactor i x
--      | (i >= (length x)) = x
--      | ((length (x !! i)) > 1) && (judgeCondition (reduceStep i x)) = reduceFactor i (reduceStep i x)
--      | otherwise = reduceFactor (i+1) x


-- 初期状態として、整数集合の要素を全て掛けあわせた値の素因数分解表現をもつ
initFactorList = group (factors (product integers))
-- 条件「整数集合の全てで割り切れる」を維持したまま、余分な素因数を全て取り除いた素因数分解表現
reducedFactorList = reduceFactor initFactorList

main = do {
         print initFactorList;
         print reducedFactorList;
         print (product (concat reducedFactorList))
       }
-- answer = 232792560


