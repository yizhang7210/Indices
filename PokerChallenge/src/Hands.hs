module Hands where

import Data.Map (fromListWith, toList)
import Data.List (sort, sortBy, nub, intersect, union, reverse)

-- Type definitions
-- Card
data Suit = C | D | H | S deriving (Show, Eq, Read);
data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine |
    Ten | Jack | Queen | King | Ace
    deriving (Show, Eq, Read, Ord, Enum, Bounded);

data Card = Card {
    rank :: Rank,
    suit :: Suit
} deriving (Show, Eq, Read)

instance Ord Card where
    (Card r1 s1) `compare` (Card r2 s2) = r1 `compare` r2

-- Hand
newtype Hand = Hand {
    cards :: [Card]
} deriving (Show)

newHand :: [Card] -> Hand
newHand x
    | length x /= 5 = error "A hand has exactly 5 cards"
    | nub x /= x = error "A hand has to have unique cards"
    | otherwise = Hand x

instance Eq Hand where
    h1 == h2 = h1 `compare` h2 == EQ

instance Ord Hand where
    h1 `compare` h2
        | getHandScore h1 /= getHandScore h2 = getHandScore h2 `compare` getHandScore h1
        | otherwise = h1 `closeCompare` h2

-- Methods
closeCompare :: Hand -> Hand -> Ordering
closeCompare h1 h2 = compareInOrderBy fst (getRankCountDesc h1) (getRankCountDesc h2)

compareInOrderBy :: (Ord b)=> (a -> b) -> [a] -> [a] -> Ordering
compareInOrderBy _ [] [] = EQ
compareInOrderBy f (x:xs) (y:ys)
    | f x == f y = compareInOrderBy f xs ys
    | otherwise = f x `compare` f y

getRankCountDesc :: Hand -> [(Rank, Int)]
getRankCountDesc h = sortBy rankDesc . toList $ fromListWith (+) [(x, 1) | x <- map rank (cards h)] where
    rankDesc x y
        | snd x /= snd y = snd y `compare` snd x
        | otherwise = fst y `compare` fst x

getHandScore :: Hand -> Int
getHandScore h
    | isStraight h && isFlush h = 1
    | isFourOfAKind h = 2
    | isFullHouse h = 3
    | isFlush h = 4
    | isStraight h = 5
    | isThreeOfAKind h = 6
    | isTwoPairs h = 7
    | isOnePair h = 8
    | otherwise = 9

isStraight :: Hand -> Bool
isStraight h
    | minimum ranks > Ten = False
    | otherwise = maximum ranks == iterate succ (minimum ranks) !! 4 where
        ranks = map rank . cards $ h

isFlush :: Hand -> Bool
isFlush h = and $ map equalFirst suits where
    equalFirst = (==) . suit . head . cards $ h
    suits = map suit . cards $ h

isFourOfAKind :: Hand -> Bool
isFourOfAKind h = snd (getRankCountDesc h !! 0) == 4

isFullHouse :: Hand -> Bool
isFullHouse h = snd (getRankCountDesc h !! 0) == 3 && snd (getRankCountDesc h !! 1) == 2

isThreeOfAKind :: Hand -> Bool
isThreeOfAKind h = snd (getRankCountDesc h !! 0) == 3 && not (isFullHouse h)

isTwoPairs :: Hand -> Bool
isTwoPairs h = snd (getRankCountDesc h !! 0) == 2 && snd (getRankCountDesc h !! 1) == 2

isOnePair :: Hand -> Bool
isOnePair h = snd (getRankCountDesc h !! 0) == 2 && not (isTwoPairs h)

compareByCard :: Hand -> Hand -> Ordering
compareByCard h1 h2 = compareInOrderBy id sortedCards1 sortedCards2 where
    sortedCards1 = reverse . sort . map rank $ cards h1
    sortedCards2 = reverse . sort . map rank $ cards h2




