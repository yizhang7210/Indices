-- | Imports:
import System.IO
import System.Directory
import Data.List
import Control.Exception
import System.Environment

-- | Commandline arguments: getArgs, getProgName:

-- | Todo list:

dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove
dispatch command = doesntExist command

doesntExist :: String -> [String] -> IO()
doesntExist command _ = putStrLn $ "Command " ++ command ++ "doesn't exist"


main = do
    (command:argList) <- getArgs
    dispatch command argList

add ::[String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO()
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
                    [0..] todoTasks
    putStr $ unlines numberedTasks

remove :: [String] -> IO()
remove [fileName, numberString] = do
    contents <- readFile "todo.txt"
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
                    [0..] todoTasks
    putStrLn "These are your todo items:"
    mapM_ putStrLn numberedTasks
    let number = read numberString
        newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
    bracketOnError (openTempFile "." "temp")
        (\(tmpName, tmpHandle) -> do
            hClose tmpHandle
            removeFile tmpName)
        (\(tmpName, tmpHandle) -> do
            hPutStr tmpHandle newTodoItems
            hClose tmpHandle
            removeFile fileName
            renameFile tmpName fileName)
