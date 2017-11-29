import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import Hands
import Game
import TestHands (handTests)
import TestGame (gameTests)

main = defaultMain $ testGroup "All Tests" [handTests, gameTests]
