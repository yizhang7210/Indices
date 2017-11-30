module Game where

import Data.List
import Hands

getBestHand :: [Card] -> Hand
getBestHand theCards = maximum . map newHand $ zipWith (\\) (repeat theCards) twoCardCombos where
    twoCardCombos = [[c1, c2] | c1 <- theCards, c2 <- theCards, c1 /= c2]


getWinningHand :: [Card] -> [[Card]] -> [Int]
getWinningHand board pockets
    | length board /= 5 = error "There has to be 5 cards on the board"
    | length pockets > 10 || length pockets < 2 = error "Game has to be between 2-10 players"
    | not $ all ((2==) . length) pockets  = error "Each player has to have 2 pocket cards"
    | otherwise = maximum bestHands `elemIndices` bestHands where
        bestHands = map getBestHand . map (++ board) $ pockets
