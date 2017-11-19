module Types
( Point(..),
  Shape(..),
  area,
  nudge,
  baseCircle,
  baseRect
  ) where

-- | Imports:
import Basics
import qualified Data.Map as Map


-- | Shapes:
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

area :: Shape -> Float
area (Circle _ r) = pi * r ^ 2
area (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x + a) (y + b)) r
nudge (Rectangle (Point x y) (Point r s)) a b
	= Rectangle (Point (x + a) (y + b)) (Point (r + a) (s + b))

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)


-- | Person:
data Person = Person { firstName :: String,
					   lastName :: String,
					   age :: Int,
					   height :: Float,
					   phoneNumber :: String,
					   flavor :: String } deriving (Eq, Show)


 -- | Vector:
data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
vplus (Vector i j k) (Vector a b c) = Vector (i + a) (j + b) (k + c)

dotProd :: (Num a) => Vector a -> Vector a -> a
dotProd (Vector i j k) (Vector a b c) = i * a + j * b + k * c

vmult ::(Num a) => Vector a -> a -> Vector a
vmult (Vector i j k) m = Vector (i * m) (j * m) (k * m)

-- | Day:
data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun
	deriving (Eq, Ord, Show, Read, Bounded, Enum)


-- | Type Synonym:
type Name = String
type PhoneNumber = String
type PhoneBook = [(Name, PhoneNumber)]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name phoneNum phoneBook = (name, phoneNum) `elem` phoneBook

data LockerState = Taken | Free deriving (Show, Read, Eq)

type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup num map = case Map.lookup num map of
	Nothing -> Left $ "Locker " ++ show num ++ " doesn't exist"
	Just (state, code) -> if state /= Taken then Right code
						  else Left $ "Locker " ++ show num ++ "is taken"


-- | Tree:
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
	| x == a = Node x left right
	| x < a = Node a (treeInsert x left) right
	| otherwise = Node a left (treeInsert x right)


treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
	| x == a = True
	| x < a = treeElem x left
	| otherwise = treeElem x right


-- | Type Class:
data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
	Red == Red = True
	Yellow == Yellow = True
	Green == Green = True
	_ == _ = False

instance Functor Tree where
	fmap f EmptyTree = EmptyTree
	fmap f (Node x left right) = Node (f x) (fmap f left) (fmap f right)











