-- | Imports:
import Control.Monad
import Data.Char
import System.IO
import Control.Exception

--main = forever $ do
--    l <- getLine
--    putStrLn $ map toUpper l

--main = do
--    contents <- getContents
--    putStr $ map toUpper contents

--main = do
--    contents <- getContents
--    putStr . shortLines $ contents

--main = interact shortLines

shortLines :: String -> String
shortLines = unlines . filter ( \x -> length x < 10) . lines

respondPalindromes :: String -> String
respondPalindromes = unlines . 
    map (\xs -> if isPal xs then "palindrome" else "not a palindrome") .
    lines
    where isPal xs = xs == reverse xs

--main = interact respondPalindromes

--main = do
--    handle <- openFile "shortlines.txt" ReadMode
--    contents <- hGetContents handle
--    putStr contents
--    hClose handle

main = do
    withFile "shortlines.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr contents)

withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
withFile' name mode f = bracket (openFile name mode)
    (\handle -> hClose handle)
    (\handle -> f handle)












