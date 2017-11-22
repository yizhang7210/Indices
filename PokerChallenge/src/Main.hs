module Main where

import           Hands

a = Card H Five
b = Card S Ten
main :: IO ()
main = do
    putStrLn . show $ a
