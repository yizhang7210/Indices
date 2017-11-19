-- | Imports:

import System.Random
import Control.Monad(when)

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen = 
    let (firstCoin, newGen) = random gen
        (secondCoin, newGen') = random newGen
        (thirdCoin, _) = random newGen'
    in (firstCoin, secondCoin, thirdCoin)


randoms' :: (RandomGen g, Random a) => g -> [a]
randoms' gen = 
    let (value, newGen) = random gen
    in value : randoms' newGen

finiteRandoms :: (RandomGen g, Random a, Eq n, Num n) => n -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen = 
    let (value, newGen) = random gen
        (restOfList, finalGen) = finiteRandoms (n-1) newGen
    in (value: restOfList, finalGen)

--main = do
--    gen <- getStdGen
--    putStrLn $ take 20 (randomRs ('a', 'z') gen)

main = do
    gen <- getStdGen
    askForNumber gen

askForNumber :: StdGen -> IO()
askForNumber gen = do
    let (randNumber, newgen) = randomR (1,10) gen :: (Int, StdGen)
    putStrLn "What do you think? 1-10"
    numberString <- getLine
    when (not $ null numberString) $ do
        let number = read numberString
        if randNumber == number
            then putStrLn "YES!!!"
            else putStrLn "Sorry..."
        askForNumber newgen


