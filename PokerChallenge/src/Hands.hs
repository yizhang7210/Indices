module Hands (
    Suit(..),
    Rank(..),
    Card(..)
) where

data Suit = C | D | H | S deriving (Show, Eq, Read);
data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine |
    Ten | Jack | Queen | King | Ace
    deriving (Show, Eq, Read, Ord, Enum, Bounded);

data Card = Card {
    suit :: Suit,
    rank :: Rank
} deriving (Show, Eq, Read)

instance Ord Card where
    (Card s1 r1) `compare` (Card s2 r2) = r1 `compare` r2
