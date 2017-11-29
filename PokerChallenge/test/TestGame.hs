module TestGame where

import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Hands
import Game (getBestHand)
import TestHands (fullHouse)

sevenCards = [Card Two S, Card King S, Card Two C, Card Seven S, Card Queen H, Card Seven H, Card Seven D]

gameTests :: TestTree
gameTests = testGroup "Poker game tests"
    [ testCase "Can determine the best hand out of 7 cards" $
        assertEqual "" fullHouse (getBestHand sevenCards)
    ]

