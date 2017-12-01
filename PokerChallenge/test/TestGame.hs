module TestGame where

import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Hands
import Game
import TestHands (fullHouse)

sevenCards = map newCard ["Ks", "2c", "7s", "Qh", "7h", "2s", "7d"]

boardCards = map newCard ["Ah", "8s", "6s", "4s", "As"]
flush = map newCard ["Ks", "Qs"]
lowerFullHouse = map newCard ["8c", "8d"]
upperFullHouse = map newCard ["Ac", "6h"]
straightFlush = map newCard ["7s", "5s"]
straight = map newCard ["7s", "5h"]

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

