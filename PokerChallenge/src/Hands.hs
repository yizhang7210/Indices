module Hands where

-- Type definitions
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

type Hand = [Card]


-- Methods
getHandScore :: Hand -> Int
getHandScore _ = 1
