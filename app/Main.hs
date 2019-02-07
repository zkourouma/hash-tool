module Main where

import           Data.Char
import           Data.Digest.Pure.MD5 (MD5Digest)
import           Data.Semigroup       ((<>))
import           Options.Applicative

import           CliParser            (Indexed (Indexed), Location (Location),
                                       location)
import           Hashing              (calcHash, simpleHash)

hashThings :: Location -> IO ()
hashThings (Location uuid Nothing) = displayHelper $ simpleHash uuid
hashThings (Location uuid (Just (Indexed index remainder))) =
  displayHelper $ calcHash uuid index remainder

displayHelper :: MD5Digest -> IO ()
displayHelper = print . map toLower . take 4 . show

main :: IO ()
main = hashThings =<< execParser opts
  where
    opts =
      info
        (location <**> helper)
        (fullDesc <> progDesc "Calculate a hash for UUID" <>
         header "hash tool - a tool for calculating hashes")
