module Game where

import Data.List
import Hands

-- Type definitions
data Rule = COMP | MR | STR | MS deriving (Show, Eq, Read);

-- Methods
getBestHandByRule :: Rule -> [Card] -> Hand
getBestHandByRule r theCards = maximumBy comparator . map newHand $ zipWith (\\) (repeat theCards) twoCardCombos where
    twoCardCombos = [[c1, c2] | c1 <- theCards, c2 <- theCards \\ [c1]]
    comparator = getComparator r

getWinningHandByRule :: Rule -> [Card] -> [[Card]] -> [Int]
getWinningHandByRule r board pockets
    | length board /= 5 = error "There has to be 5 cards on the board"
    | length pockets > 10 || length pockets < 2 = error "Game has to be between 2-10 players"
    | not $ all ((2==) . length) pockets = error "Each player has to have 2 pocket cards"
    | otherwise = (maximumBy comparator bestHands) `elemIndices` bestHands where
        bestHands = map (getBestHandByRule r) . map (++ board) $ pockets
        comparator = getComparator r

getComparator :: Rule -> (Hand -> Hand -> Ordering)
getComparator COMP = compare
getComparator MR = compareHandsWithValidScores [2,3,6,7,8]
getComparator STR = compareHandsWithValidScores [1,5]
getComparator MS = compareHandsWithValidScores [1,4]

compareHandsWithValidScores :: [Int] -> (Hand -> Hand -> Ordering)
compareHandsWithValidScores validScores h1 h2
    | onRuleSet h1 && onRuleSet h2 = h1 `compare` h2
    | onRuleSet h1 = GT
    | onRuleSet h2 = LT
    | otherwise = h1 `compareByCard` h2 where
        onRuleSet h = any (getHandScore h ==) validScores

