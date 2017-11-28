import Test.Tasty (defaultMain, testGroup, TestTree)
import Test.Tasty.HUnit (assertEqual, testCase)
import Hands

main = defaultMain tests

-- Example hands
straightFlush :: Hand
straightFlush = [Card Seven S, Card Eight S, Card Nine S, Card Ten S, Card Jack S]

fourOfAKind :: Hand
fourOfAKind  = [Card Two S, Card Two H, Card Two C, Card Two D, Card Jack S]

fullHouse :: Hand
fullHouse = [Card Two S, Card Two C, Card Seven S, Card Seven H, Card Seven D]

flush :: Hand
flush = [Card Two S, Card King S, Card Seven S, Card Ten S, Card Jack S]

straight :: Hand
straight = [Card Seven S, Card Eight H, Card Nine C, Card Ten S, Card Jack S]

threeOfAKind :: Hand
threeOfAKind  = [Card Ten S, Card Ten H, Card Ten C, Card Four C, Card Jack S]

twoPairs :: Hand
twoPairs  = [Card Ten S, Card Ten H, Card Eight C, Card Eight H, Card Jack S]

onePair :: Hand
onePair  = [Card Ten S, Card Ten H, Card Ace C, Card Eight H, Card Jack S]

highCards :: Hand
highCards  = [Card Ten S, Card Queen H, Card Ace C, Card Eight H, Card Jack S]

-- Tests
tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests :: TestTree
unitTests = testGroup "Unit tests"
    [ testCase "Can detect straight flush" $
        assertEqual "" 1 (getHandScore straightFlush),
      testCase "Can detect four of a kind" $
        assertEqual "" 2 (getHandScore fourOfAKind),
      testCase "Can detect full house" $
        assertEqual "" 3 (getHandScore fullHouse),
      testCase "Can detect flush not straight" $
        assertEqual "" 4 (getHandScore flush),
      testCase "Can detect straight not flush" $
        assertEqual "" 5 (getHandScore straight),
      testCase "Can detect three of a kind" $
        assertEqual "" 6 (getHandScore threeOfAKind),
      testCase "Can detect two pairs" $
        assertEqual "" 7 (getHandScore twoPairs),
      testCase "Can detect one pair" $
        assertEqual "" 8 (getHandScore onePair),
      testCase "Can detect high cards" $
        assertEqual "" 9 (getHandScore highCards)
    ]

