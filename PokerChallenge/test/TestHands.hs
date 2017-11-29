module TestHands where

import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Hands

-- Example hands
straightFlush = newHand [Card Seven S, Card Eight S, Card Nine S, Card Ten S, Card Jack S]
betterStraightFlush = newHand [Card Queen H, Card King H, Card Jack H, Card Ten H, Card Nine H]

fourOfAKind = newHand [Card Five S, Card Five H, Card Five C, Card Five D, Card Four S]
worsefourOfAKind = newHand [Card Two S, Card Two H, Card Two C, Card Two D, Card Jack S]

fullHouse = newHand [Card Two S, Card Two C, Card Seven S, Card Seven H, Card Seven D]
worseFullHouse = newHand [Card Two S, Card Two C, Card Two D, Card Seven H, Card Seven D]
equalFullHouse = newHand [Card Two H, Card Two C, Card Seven C, Card Seven H, Card Seven D]

flush = newHand [Card King S, Card Two S, Card Seven S, Card Ten S, Card Jack S]
betterFlush = newHand [Card Queen S, Card King S, Card Seven S, Card Ten S, Card Jack S]

straight = newHand [Card Seven S, Card Eight H, Card Nine C, Card Ten S, Card Jack S]
betterStraight = newHand [Card Queen S, Card Eight H, Card Nine C, Card Ten S, Card Jack S]

threeOfAKind = newHand [Card Ten S, Card Ten H, Card Ten C, Card Four C, Card Jack S]
worseThreeOfAKind = newHand [Card Ten S, Card Ten H, Card Ten C, Card Three C, Card Jack S]

twoPairs = newHand [Card Ten S, Card Ten H, Card Eight C, Card Eight H, Card Jack S]
betterTwoPairs = newHand [Card Jack S, Card Jack H, Card Four C, Card Four H, Card Ten S]

onePair = newHand [Card Ten S, Card Ten H, Card Ace C, Card Eight H, Card Jack S]
worseOnePair = newHand [Card Five S, Card Ace H, Card Five C, Card Eight H, Card Jack S]

highCards = newHand [Card Seven S, Card Queen H, Card King C, Card Eight H, Card Jack S]
betterHighCards = newHand [Card Ten S, Card Three H, Card Ace C, Card Five H, Card Jack S]

-- Tests
handTests :: TestTree
handTests = testGroup "Poker hand tests" [handScores, handCompares]

handScores :: TestTree
handScores = testGroup "Can detect different hand types tests"
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

handCompares :: TestTree
handCompares = testGroup "Can compare hands of the same type"
    [ testCase "Different hand types" $
        assertBool "" (straightFlush > threeOfAKind),
      testCase "Equal hands" $
        assertBool "" (fullHouse == equalFullHouse),
      testCase "Straight flush" $
        assertBool "" (straightFlush < betterStraightFlush),
      testCase "Four of a kind" $
        assertBool "" (straightFlush < betterStraightFlush),
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
        assertBool "" (highCards < betterHighCards)
    ]

