module TestGame where

import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Hands
import Game
import TestHands (fullHouse)

sevenCards = [Card Two S, Card King S, Card Two C, Card Seven S, Card Queen H, Card Seven H, Card Seven D]

boardCards = [Card Ace H, Card Eight S, Card Six S, Card Four S, Card Ace S]
flush = [Card King S, Card Queen S]
lowerFullHouse = [Card Eight C , Card Eight D]
upperFullHouse = [Card Ace C , Card Six H]
straightFlush = [Card Seven S , Card Five S]
straight = [Card Seven S, Card Five H]

gameTests :: TestTree
gameTests = testGroup "Poker game tests"
    [ testCase "Can determine the best hand out of 7 cards" $
        assertEqual "" fullHouse (getBestHandByRule COMP sevenCards),
      testCase "Can determine the best hand in Casino Royale" $
        assertEqual "" [1, 3] (getWinningHandByRule COMP boardCards [flush, straightFlush, lowerFullHouse, straightFlush, upperFullHouse]),
      testCase "Can determine the best hand using Matching Ranks rule" $
        assertEqual "" [2] (getWinningHandByRule MR boardCards [flush, lowerFullHouse, upperFullHouse, straightFlush]),
      testCase "Can determine the best hand using Straight rule" $
        assertEqual "" [1] (getWinningHandByRule STR boardCards [flush, straight, lowerFullHouse, upperFullHouse]),
      testCase "Can determine the best hand using Matching Suits rule" $
        assertEqual "" [0] (getWinningHandByRule MS boardCards [flush, straight, lowerFullHouse, upperFullHouse])
    ]

