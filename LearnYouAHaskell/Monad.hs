-- | Monads:

import Control.Monad
import Control.Monad.State
import Control.Monad.Writer
import Data.List (all)
import Data.Monoid
import Data.Ratio
import System.Random

-- | Examples:
a = (Just 5) >>= (\x -> Just (x ^ 2))

applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMabe (Just x) f = f x 

-- | Example: Pierre and the pole
type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft x (l, r)
    | abs(l + x - r) < 4 = Just (l + x, r)
    | otherwise = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight x (l, r)
    | abs(r + x - l) < 4 = Just (l, r + x)
    | otherwise = Nothing

result = return (0, 0) >>= landLeft 3 >>= landRight 1 >>= landRight 1 >>= landLeft 2

-- | Basically same as >>
banana :: Pole -> Maybe Pole
banana _ = Nothing

foo :: Maybe String
foo = do
    x <- Just 3
    y <- Just "4"
    Just (show x ++ y)


result' = do
    start <- return (0, 0)
    first <- landLeft 3 start
    second <- landRight 1 first
    third <- landRight 1 second
    final <-landLeft 2 third
    return final


-- | Examples in list:
ll = [3,4,5] >>= (\x -> [x, -x])

sevensOnly :: [Int]
sevensOnly = do
    x <- [1..50]
    guard ('7' `elem` show x)
    return x

-- | Knight:
type KnightPos = (Int, Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c, r) = do
    (c', r') <- [(c+x, r+y) | x <- [1, -1, 2, -2], y <- [1, -1, 2, -2], abs(x) + abs(y) == 3]
    guard (c' `elem` [1..8] && r' `elem` [1..8])
    return (c', r')

in3 :: KnightPos -> [KnightPos]
in3 start = do
    return start >>= moveKnight >>= moveKnight >>= moveKnight

canReachIn3 :: KnightPos -> KnightPos-> Bool
canReachIn3 start end = end `elem` in3 start


-- | More Monads:

isBigGang :: Int -> (Bool, String)
isBigGang x = (x > 9, "Compare to 9")

applyLog :: (Monoid m) => (a, m) -> (a -> (b, m)) -> (b, m)
applyLog (x, log) f = let (y, newLog) = f x in (y, log `mappend` newLog)


type Food = String
type Price = Sum Int

addDrink :: Food -> (Food, Price)
addDrink "beans" = ("milk", Sum 25)
addDrink "jerky" = ("whiskey", Sum 99)
addDrink _ = ("beer", Sum 30)

dd = ("kk", Sum 0) `applyLog` addDrink

-- | Writer.

logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["Got number: " ++ show x])

multWithLog :: Writer [String] Int
multWithLog = do
    a <- logNumber 3
    b <- logNumber 5
    return (a * b)

gcd' :: Int -> Int -> Writer [String] Int
gcd' a b
    | b == 0 = do
        tell ["Finished with " ++ show a]
        return a
    | otherwise = do
        tell [show a ++ "mod" ++ show b ++ "=" ++ show (a `mod` b)]
        gcd' b (a `mod` b)

-- | Difference list
newtype DiffList a = DiffList { getDiffList :: [a] -> [a]}

toDiffList :: [a] -> DiffList a
toDiffList xs = DiffList (xs ++)

fromDiffList :: DiffList a -> [a]
fromDiffList (DiffList f) = f []

instance Monoid (DiffList a) where
    mempty = DiffList (\xs -> [] ++ xs)
    (DiffList f) `mappend` (DiffList g) = DiffList (f . g)


finalCountDown ::Int -> Writer (DiffList String) ()
finalCountDown 0 = do
    tell (toDiffList ["0"])
finalCountDown x = do
    finalCountDown (x - 1)
    tell (toDiffList [show x])


finalCountDown' :: Int -> Writer [String] ()
finalCountDown' 0 = do
    tell ["0"]
finalCountDown' x = do
    finalCountDown' (x - 1)
    tell [show x]

-- | Stateful Monad.

-- | Stack
type Stack = [Int]

pop :: Stack -> (Int, Stack)
pop (x:xs) = (x, xs)

push :: Int -> Stack -> ((), Stack)
push a xs = ((), a:xs)

stackManip :: Stack -> (Int, Stack)
stackManip stack = let
    ((), newStack1) = push 3 stack
    (a, newStack2) = pop newStack1
    in pop newStack2


-- | Stack with State
pop' :: State Stack Int
pop' = state $ \(x:xs) -> (x, xs)

push' :: Int -> State Stack ()
push' a = state $ \xs -> ((), a:xs)


stackManip' :: State Stack Int
stackManip' = do
    push' 3
    a <- pop'
    pop'


stackStuff :: State Stack ()
stackStuff = do
    a <- pop'
    if a == 5
        then push' 5
    else do
        push' 3
        push' 8

moreStack :: State Stack ()
moreStack = do
    a <- stackManip'
    if a == 100
        then stackStuff
        else return ()

stackyStack :: State Stack ()
stackyStack = do
    stackNow <- get
    if stackNow == [1, 2, 3]
        then put [8, 3, 1]
        else put [9, 2, 1]

newPop :: State Stack Int
newPop = do
    (x:xs) <- get
    put xs
    return x

newPush :: Int -> State Stack ()
newPush x = do
    xs <- get
    put (x:xs)

randomSt :: (RandomGen g, Random a) => State g a
randomSt = state random

threeCoins :: State StdGen (Bool, Bool, Bool)
threeCoins = do
    a <- randomSt
    b <- randomSt
    c <- randomSt
    return (a, b, c)

-- | filterM
keepSmall :: Int -> Writer [String] Bool
keepSmall x
    | x < 4 = do
        tell ["Keeping " ++ show x]
        return True
    | otherwise = do
        tell ["Nope: " ++ show x]
        return False

powerset :: [a] -> [[a]]
powerset = filterM (\x -> [True, False])

binSmall :: Int -> Int -> Maybe Int
binSmall acc x
    | x > 9 = Nothing
    | otherwise = Just (acc + x)

-- | RPN Calculator
readMaybe :: (Read a) => String -> Maybe a
readMaybe st = case reads st of [(x, "")] -> Just x
                                _ -> Nothing

foldingFunction :: [Double] -> String-> Maybe [Double]
foldingFunction (x:y:ys) "*" = return ((y * x):ys)
foldingFunction (x:y:ys) "+" = return ((y + x):ys)
foldingFunction (x:y:ys) "-" = return ((y - x):ys)
foldingFunction xs numberString = liftM (:xs) (readMaybe numberString)

solveRPN :: String -> Maybe Double
solveRPN st = do
    [result] <- foldM foldingFunction [] (words st)
    return result

-- | Composition
inMany :: Int -> KnightPos -> [KnightPos]
inMany x start = return start >>= foldr (<=<) return (replicate x moveKnight)

canReachIn :: Int -> KnightPos -> KnightPos -> Bool
canReachIn x start end = end `elem` inMany x start


-- | New Monads
newtype Prob a = Prob { getProb :: [(a, Rational)] } deriving Show

instance Functor Prob where
    fmap f (Prob xs) = Prob $ map (\(x, p) -> (f x, p)) xs

flatten :: Prob (Prob a) -> Prob a
flatten (Prob xs) = Prob $ concat $ map multAll xs
    where multAll (Prob innerxs, p) = map(\(x, r) -> (x, r * p)) innerxs

instance Monad Prob where
    return x = Prob [(x, 1%1)]
    m >>= f = flatten (fmap f m)
    fail _ = Prob []

data Coin = Heads | Tails deriving (Show, Eq)

coin :: Prob Coin
coin = Prob [(Heads, 1%2), (Tails, 1%2)]

loadedCoin :: Prob Coin
loadedCoin = Prob [(Heads, 1%10), (Tails, 9%10)]

flipThree :: Prob Bool
flipThree = do
    a <- coin
    b <- coin
    c <- loadedCoin
    return (all (== Tails) [a, b, c])














