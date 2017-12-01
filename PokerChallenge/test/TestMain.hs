import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, assertBool, testCase)
import TestHands (handTests)
import TestGame (gameTests)

main = defaultMain $ testGroup "All Tests" [handTests, gameTests]
