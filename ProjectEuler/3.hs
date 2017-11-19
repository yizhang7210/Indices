-- My Solution
theNumber = 600851475143

factors :: Integer -> [Integer]
factors 0 = []
factors 1 = []
factors n = f : factors (n `div` f)
    where f = head $ filter (\d -> n `mod` d == 0) [2..round . sqrt $ fromIntegral n] ++ [n]

main = print $ factors theNumber
-- Returns [71,839,1471,6857]
