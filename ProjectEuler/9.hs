-- My Solution
isSquare :: Integer -> Bool
isSquare x = ((^ 2) . round . sqrt . fromIntegral $ x) == x

getTuple :: Integer -> Integer -> [Integer]
getTuple x y
    | isSquare (x^2 - y^2) && x + y + z == 1000 = [x, y, z]
    | otherwise = []
    where z = round . sqrt . fromIntegral $ x^2 - y^2

main = print . product $ filter (not . null) [getTuple x y | x <- [334..499], y <- [1..333]] !! 0

