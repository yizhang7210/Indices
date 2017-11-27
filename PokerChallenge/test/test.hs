import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, testCase)
import Hands

main = defaultMain tests

straightFlush :: Hand
straightFlush = [Card Seven S, Card Eight S, Card Nine S, Card Ten S, Card Jack S]


tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [ testCase "Can detect straight flush" $
        assertEqual "" 1 (getHandScore straightFlush)]

