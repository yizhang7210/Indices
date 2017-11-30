module TestGame where

import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Hands
import Game (getBestHand, getWinningHand)
import TestHands (fullHouse)

sevenCards = [Card Two S, Card King S, Card Two C, Card Seven S, Card Queen H, Card Seven H, Card Seven D]

boardCards = [Card Ace H, Card Eight S, Card Six S, Card Four S, Card Ace S]
player1 = [Card King S, Card Queen S]
player2 = [Card Eight C , Card Eight D]
laChiffre = [Card Ace C , Card Six H]
bond = [Card Seven S , Card Five S]


gameTests :: TestTree
gameTests = testGroup "Poker game tests"
    [ testCase "Can determine the best hand out of 7 cards" $
        assertEqual "" fullHouse (getBestHand sevenCards),
      testCase "Can determine the best hand in Casino Royale" $
        assertEqual "" [1, 3] (getWinningHand boardCards [player1, bond, player2, bond, laChiffre])
    ]

