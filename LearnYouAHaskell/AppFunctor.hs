-- | Imports:

import Data.Char
import Data.List
import Control.Applicative


-- | IO as a functor:
--main = do line <- fmap reverse getLine
--          putStrLn $ "The reverse line " ++ line
--          putStrLn $ "lalala"

--main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
--       putStrLn $ line

-- | Counter example of Functor:
data CMaybe a = CNothing | CJust Int a deriving (Show)

instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = (CJust (counter + 1) (f x))

-- | Maybe as Applicative:

a = pure (+3) <*> Just 10
b = Just (take 4) <*> Just [1..]
c = (+) <$> Left "dsfa" <*> Left "fes"

-- | List as Applicative:

d =  [(+1), (*4)] <*> [5,6,7,8]

-- | IO as Applicative:

myAction :: IO String

--myAction = do
--    a <- getLine
--    b <- getLine
--    return $ a ++ b

myAction = (++) <$> getLine <*> getLine

-- | Functions as Applicative:

e = (++) <$> map (+3) <*> take 4 $ [1..8]

-- | ZipList
f = getZipList $ (+) <$> ZipList [1,2,3] <*> ZipList [9,7,6]

-- | Useful Functions for Applicatives:
g = liftA2 (:) (Just 3) (Just [1,2,3])

sequenceA :: (Applicative f) => [f a] -> f [a]
sequenceA [] = pure []
sequenceA (x:xs) = (:) <$> x <*> sequenceA xs

sequenceA' :: (Applicative f) => [f a] -> f [a]
sequenceA' = foldr (liftA2 (:)) (pure [])









