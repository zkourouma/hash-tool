module Hashing
  ( calcHash
  , simpleHash
  ) where

import           Data.ByteString.Lazy.Char8 (pack)
import           Data.Digest.Pure.MD5       (MD5Digest, md5)

calcHash :: String -> Integer -> Integer -> MD5Digest
calcHash uuid idx remainder = md5 $ pack $ concat [uuid, [':'], idx']
  where
    idx' = show $ idx `rem` remainder

simpleHash :: String -> MD5Digest
simpleHash = md5 . pack
