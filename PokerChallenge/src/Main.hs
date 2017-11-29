module Main where

import           Hands

a = Card Five H
b = Card Ten S

c :: Hand
c = newHand [a,b]
main :: IO ()
main = do
    putStrLn $ show c ++ "!!"
