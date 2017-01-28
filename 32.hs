-- My Solution, which looks pretty ugly now.
import Data.Char
import Data.List
import Numeric

l :: Int -> Int -> Int
l x y = digitToInt . last. show $ (x*y)

endings :: [(Int, Int, Int)]
endings = [(x,y,l x y) | x<-[1..9], y<-[1..9], x /= y, (l x y) `elem` [1..9], (l x y) /= x, (l x y) /= y]

sections :: [(Int, Int, Int)]
sections = [(x,y,z) | x<-[1..9], y<-[1..9], z<-[1..9], x <= y, x+y+z == 9, z <= x+y , z >= x+y-1]

splitSection :: (Int, Int, Int) -> [Int] -> [[Int]]
splitSection (l, m, n) list = [sec1, sec2, sec3] where
    sec1 = fst $ splitAt l list
    secondList = snd $ splitAt l list
    sec2 = fst $ splitAt m secondList
    sec3 = snd $ splitAt m secondList

allSections ::[[[Int]]]
allSections = [splitSection s p | s <- sections, p <- permutations [1..9]]

filterByEndings :: [(Int, Int, Int)] -> [[Int]] -> Bool
filterByEndings [] _ = False
filterByEndings ((a,b,c):xs) list = thisPass || filterByEndings xs list where
    thisPass = (last (list !! 0) == a && last (list !! 1) == b && last (list !! 2) ==c)

listToNum :: [Int] -> Int
listToNum l = read . foldl (++) "" $ map show l

filterByProduct :: [[Int]] -> Bool
filterByProduct list = (num1 * num2 == num3) where
    num1 = listToNum (list !! 0)
    num2 = listToNum (list !! 1)
    num3 = listToNum (list !! 2)

getProduct :: [[Int]] -> Int
getProduct l = listToNum $ l !! 2

--main = print . sum . nub . map getProduct $ filter filterByProduct $ filter (filterByEndings endings) allSections

 Best I saw from the thread.
main = print. sum $ nub[v*t| v<-[4..49], t <- [v+1..1987], pandig . sort $ digs (v*t) ++ digs v ++ digs t] where
    pandig ds | "123456789" == ds = True
              | otherwise = False
    digs k = showInt k ""

