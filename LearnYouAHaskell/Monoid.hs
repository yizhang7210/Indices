-- | Monoids.
import Data.Monoid

-- | newtype:

--newtype ZipList a = ZipList {getZipList :: [a] }

newtype CharList = CharList { getCharList :: [Char] } deriving (Eq, Show)

newtype Pair b a = Pair { getPair :: (a,b) }

instance Functor (Pair c) where
    fmap f (Pair (x, y)) = Pair (f x, y)


a = getPair $ fmap (*100) (Pair (2, 3))
b = getPair $ fmap reverse (Pair ("london calling", 3))

-- | newtype v.s. data on laziness

data CoolBool = CoolBool {getCoolBool :: Bool }
--newtype CoolBool = CoolBool {getCoolBool :: Bool }

helloMe :: CoolBool -> String
helloMe (CoolBool _) = "hello"

-- | Monoid is a semi-group with an identity.

lengthCompare :: String -> String -> Ordering
lengthCompare x y = (length x `compare` length y) `mappend` (x `compare` y)




