-- | Imports:
import Data.List

-- | Reverse polish notation calculator:
solveRPN :: String -> Double
solveRPN = head . foldl dealStack [] . words
    where dealStack (x:y:xs) "*" = (x*y) : xs
          dealStack (x:y:xs) "+" = (x+y) : xs
          dealStack (x:y:xs) "-" = (y-x) : xs
          dealStack xs num = read num : xs


-- | Shortest path of a road system:
-- | Make the type Section for input:
data Section = Section { getA :: Int, getB :: Int, getC :: Int}
    deriving (Show)
type RoadSystem = [Section]

-- | Make the type Label for representing edge selection:
data Label = A | B | C deriving (Show)

type Path = [(Label, Int)]

-- | Comparing the shortest path for each section:
roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) = 
    let timeA = sum (map snd pathA)
        timeB = sum (map snd pathB)
        forwardToA = timeA + a
        crossToA = timeB + b + c
        forwardToB = timeB + b
        crossToB = timeA + a + c
        newPathToA = if forwardToA <= crossToA
                        then (A, a) : pathA
                        else (C, c) : (B ,b) : pathB
        newPathToB = if forwardToB <= crossToB
                        then (B, b) : pathB
                        else (C, c) : (A, a) : pathA
        in (newPathToA, newPathToB)

-- | Do optimal path:
optimalPath :: RoadSystem -> Path
optimalPath road = 
    let (bestAPath, bestBPath) = foldl roadStep ([], []) road
    in if sum (map snd bestAPath) <= sum (map snd bestBPath)
        then reverse bestAPath
        else reverse bestBPath

-- | Let's try it:
heathrowToLondon :: RoadSystem
heathrowToLondon = [Section 50 10 30, Section 5 90 20, Section 40 2 25, Section 10 8 0]

-- | Parse input:
groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
groupsOf n xs = take n xs : groupsOf n (drop n xs)

-- | Main:
main = do
    content <- getContents
    let threes = groupsOf 3 (map read $ lines content)
        road = map (\[a,b,c] -> Section a b c) threes
        path = optimalPath road
        pathString = concat $ map (show . fst) path
        pathTime = sum $ map snd path
    putStrLn $ "The best path to take is: " ++ pathString
    putStrLn $ "Time taken: " ++ show pathTime










