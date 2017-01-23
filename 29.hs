-- My Solution
import Data.Set

uniq :: (Ord a) => [a] -> [a]
uniq l = toList . fromList $ l


main = print . length . uniq $ [a^b | a <- [2..100], b <- [2..100]]
