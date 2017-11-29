module Hands where

import Data.Map (fromListWith, toList)
import Data.List (sortBy, nub, intersect, union)

-- Type definitions
-- Card
data Suit = C | D | H | S deriving (Show, Eq, Ord, Read);
data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine |
    Ten | Jack | Queen | King | Ace
    deriving (Show, Eq, Read, Ord, Enum, Bounded);

data Card = Card {
    rank :: Rank,
    suit :: Suit
} deriving (Show, Eq, Read)

instance Ord Card where
    (Card r1 s1) `compare` (Card r2 s2)
        | r1 /= r2 = r1 `compare` r2
        | otherwise = s1 `compare` s2

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
    h1 == h2 = cards h1 `intersect` cards h2 == cards h1 `union` cards h2

instance Ord Hand where
    h1 `compare` h2
        | getHandScore h1 /= getHandScore h2 = getHandScore h2 `compare` getHandScore h1
        | otherwise = EQ

-- Methods
getHandScore :: Hand -> Int
getHandScore h
    | isStraightFlush h = 1
    | isFourOfAKind h = 2
    | isFullHouse h = 3
    | isFlush h = 4
    | isStraight h = 5
    | isThreeOfAKind h = 6
    | isTwoPairs h = 7
    | isOnePair h = 8
    | otherwise = 9

isStraightFlush :: Hand -> Bool
isStraightFlush h = isStraight h && isFlush h

isStraight :: Hand -> Bool
isStraight h
    | minimum ranks > Ten = False
    | otherwise = maximum ranks == iterate succ (minimum ranks) !! 4 where
        ranks = map rank . cards $ h

isFlush :: Hand -> Bool
isFlush h = and $ map equalFirst suits where
    equalFirst = (==) . suit . head . cards $ h
    suits = map suit . cards $ h

getRankCountDesc :: Hand -> [(Rank, Int)]
getRankCountDesc h = sortBy rankDesc . toList $ fromListWith (+) [(x, 1) | x <- map rank (cards h)] where
    rankDesc x y = (snd y) `compare` (snd x)

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


