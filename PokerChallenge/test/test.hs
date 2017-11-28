import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, testCase)
import Hands

main = defaultMain tests

straightFlush :: Hand
straightFlush = [Card Seven S, Card Eight S, Card Nine S, Card Ten S, Card Jack S]

straight :: Hand
straight = [Card Seven S, Card Eight H, Card Nine C, Card Ten S, Card Jack S]

flush :: Hand
flush = [Card Two S, Card King S, Card Seven S, Card Ten S, Card Jack S]

tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [ testCase "Can detect straight flush" $
        assertEqual "" 1 (getHandScore straightFlush),
      testCase "Can detect flush not straight" $
        assertEqual "" 4 (getHandScore flush),
      testCase "Can detect straight not flush" $
        assertEqual "" 5 (getHandScore straight)
    ]

