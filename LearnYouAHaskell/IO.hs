-- | Imports:
import Data.Char

-- | Functions: putStr, putChar, putStrLn, print, when, sequence, mapM, forever, forM

-- | Main:
--main = putStrLn "Hello World!"

--main = do 
--    putStrLn "Hello, your name please"
--    name <- getLine
--    putStrLn ("Hey " ++ name ++ "!!!")

--main = do
--    putStrLn "Hello, your first name please."
--    firstName <- getLine
--    putStrLn "And last name?"
--    lastName <- getLine
--    let bigFirstName = map toUpper firstName
--        bigLastName = map toUpper lastName
--    putStrLn $ "You are " ++ bigFirstName ++ " " ++ bigLastName

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

main = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line


