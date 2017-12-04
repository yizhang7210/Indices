import Hands
import Game

main :: IO ()
main = do
    table <- readFile "Game.table"
    putStrLn "------------------------------------------"
    putStrLn $ "The players in the following positions won: " ++ (show . getWinningHands $ lines table)

getWinningHands :: [String] -> [Int]
getWinningHands (r:board:pockets) = getWinningHandsByRule rule boardCards pocketCards where
    rule = read r
    boardCards = map newCard $ words board
    pocketCards = map (toCards . words) pockets
    toCards = map newCard
