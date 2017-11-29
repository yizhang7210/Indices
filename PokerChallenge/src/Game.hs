module Game where

import Data.List
import Hands

getBestHand :: [Card] -> Hand
getBestHand theCards = maximum . map newHand $ zipWith (\\) (repeat theCards) twoCardCombos where
    twoCardCombos = [[c1, c2] | c1 <- theCards, c2 <- theCards, c1 /= c2]

