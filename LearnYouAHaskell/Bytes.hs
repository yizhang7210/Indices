-- | Imports:
import System.Environment
import System.Directory
import System.IO
import Control.Exception
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S

main = do
    (fileName1 : fileName2 : _) <- getArgs
    copy fileName1 fileName2

copy :: FilePath -> FilePath -> IO ()
copy source dest = do
    contents <- B.readFile source
    bracketOnError
        (openTempFile "." "tmp")
        (\(tmpName, tmpHandle) -> do
            hClose tmpHandle
            removeFile tmpName)
        (\(tmpName, tmpHandle) -> do
            B.hPutStr tmpHandle contents
            hClose tmpHandle
            renameFile tmpName dest)
