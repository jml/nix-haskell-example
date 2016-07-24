module Main (main) where

import Protolude
import System.Process (callCommand)


main :: IO ()
main = do
  putStrLn ("Running 'pstree' ..." :: Text)
  -- Note: callCommand runs a shell command.
  -- http://hackage.haskell.org/package/process-1.4.2.0/docs/System-Process.html#g:2
  callCommand "pstree"

