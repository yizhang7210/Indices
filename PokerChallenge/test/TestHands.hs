module TestHands where

import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Hands

-- Example hands
straightFlush = newHand . map newCard $ ["7s", "8s", "9s", "Ts", "Js"]
betterStraightFlush = newHand . map newCard $ ["Qh", "Kh", "Jh", "Th", "9h"]

fourOfAKind = newHand . map newCard $ ["5s", "5h", "5c", "5d", "4s"]
worseFourOfAKind = newHand . map newCard $ ["2s", "2h", "2c", "2d", "Js"]

fullHouse = newHand . map newCard $ ["2s", "2c", "7s", "7h", "7d"]
worseFullHouse = newHand . map newCard $ ["2s", "2c", "2d", "7h", "7d"]
equalFullHouse = newHand . map newCard $ ["2h", "2c", "7c", "7h", "7d"]

flush = newHand . map newCard $ ["Ks", "2s", "7s", "Ts", "Js"]
betterFlush = newHand . map newCard $ ["Qh", "Kh", "7h", "Th", "Jh"]

straight = newHand . map newCard $ ["7s", "8h", "9c", "Ts", "Jc"]
betterStraight = newHand . map newCard $ ["Qs", "8h", "9c", "Ts", "Js"]

threeOfAKind = newHand . map newCard $ ["Ts", "Th", "Tc", "4c", "Js"]
worseThreeOfAKind = newHand . map newCard $ ["Ts", "Th", "Tc", "3c", "Js"]

twoPairs = newHand . map newCard $ ["Ts", "Th", "8c", "8h", "Js"]
betterTwoPairs = newHand . map newCard $ ["Js", "Jh", "4c", "4h", "8s"]

onePair = newHand . map newCard $ ["Ts", "Ac", "8h", "Th", "Js"]
worseOnePair = newHand . map newCard $ ["5s", "Ah", "5c", "8h", "Js"]

highCards = newHand . map newCard $ ["7s", "Qh", "Kc", "8h", "Js"]
betterHighCards = newHand . map newCard $ ["Ts", "3h", "Ac", "5h", "Js"]

-- Tests
handTests :: TestTree
handTests = testGroup "Poker hand tests" [newCardsTest, handScoresTest, handComparesTest]

newCardsTest :: TestTree
newCardsTest = testGroup "Can construct new cards from string"
    [
      testCase "Numbered card" $
        assertEqual "" (Card Four S) (newCard "4s"),
      testCase "Face card" $
        assertEqual "" (Card Queen H) (newCard "Qh"),
      testCase "Ten" $
        assertEqual "" (Card Ten C) (newCard "Tc")
    ]

handScoresTest :: TestTree
handScoresTest = testGroup "Can detect different hand types tests"
    [ testCase "Straight flush" $
        assertEqual "" 1 (getHandScore straightFlush),
      testCase "Four of a kind" $
        assertEqual "" 2 (getHandScore fourOfAKind),
      testCase "Full house" $
        assertEqual "" 3 (getHandScore fullHouse),
      testCase "Flush not straight" $
        assertEqual "" 4 (getHandScore flush),
      testCase "Straight not flush" $
        assertEqual "" 5 (getHandScore straight),
      testCase "Three of a kind" $
        assertEqual "" 6 (getHandScore threeOfAKind),
      testCase "Two pairs" $
        assertEqual "" 7 (getHandScore twoPairs),
      testCase "One pair" $
        assertEqual "" 8 (getHandScore onePair),
      testCase "High cards" $
        assertEqual "" 9 (getHandScore highCards)
    ]

handComparesTest :: TestTree
handComparesTest = testGroup "Can compare hands of the same type"
    [ testCase "Different hand types" $
        assertBool "" (straightFlush > threeOfAKind),
      testCase "Equal hands" $
        assertBool "" (fullHouse == equalFullHouse),
      testCase "Straight flush" $
        assertBool "" (straightFlush < betterStraightFlush),
      testCase "Four of a kind" $
        assertBool "" (fourOfAKind > worseFourOfAKind),
      testCase "Full house" $
        assertBool "" (fullHouse > worseFullHouse),
      testCase "Flush not straight" $
        assertBool "" (flush < betterFlush),
      testCase "Straight  not flush" $
        assertBool "" (straight < betterStraight),
      testCase "Three of a kind" $
        assertBool "" (threeOfAKind > worseThreeOfAKind),
      testCase "Two pairs" $
        assertBool "" (twoPairs < betterTwoPairs),
      testCase "One pair" $
        assertBool "" (onePair > worseOnePair),
      testCase "High cards" $
        assertBool "" (highCards < betterHighCards),
      testCase "Card by card comparison" $
        assertEqual "" LT (flush `compareByCard` onePair)
    ]

