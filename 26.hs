-- Inspired by http://blog.dreamshire.com/project-euler-26-solution
-- Copied from: https://wiki.haskell.org/Euler_problems/21_to_30#Problem_26
import Data.List
import Data.Ord

main = print . fst $ maximumBy (comparing snd) [(n,recurringCycle n) | n <- [1..999]]
    where  recurringCycle d = remainders d 10 []
           remainders d 0 rs = 0
           remainders d r rs = let r' = r `mod` d
                               in case elemIndex r' rs of
                                    Just i  -> i + 1
                                    Nothing -> remainders d (10*r') (r':rs)
