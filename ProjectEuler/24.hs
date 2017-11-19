-- My Solution
import Data.List

main = print . (!! 999999) .  sort $ permutations "0123456789"
