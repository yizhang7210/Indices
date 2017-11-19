-- My Solution
import Data.List.Split
import Data.Array

toList :: String -> [[Int]]
toList content = [map (\l -> read l :: Int) $ (splitOn " ") x | x <- lines content ]

maxPaths :: Int -> [[Int]] -> [Int]
maxPaths n mat = [table ! (n, k) | k <- [0..n]] where
    bnds = ((0,0), (n, n))
    table = listArray bnds . map maxPath' $ range bnds
    maxPath' (0, _) = mat !! 0 !! 0
    maxPath' (a, 0) = table ! (a-1, 0) + mat !!a !!0
    maxPath' (i, j) = mat!!i!!j + (max (table ! (i-1, j-1)) (table ! (i-1, min j (i-1))))

-- Question 18.
main = do
    content <- readFile "18.txt"
    print . maximum $ maxPaths 14 . toList $ content
