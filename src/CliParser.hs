module CliParser
  ( Location(Location)
  , Indexed(Indexed)
  , location
  ) where

import           Data.Semigroup      ((<>))
import           Options.Applicative

data Location =
  Location String
           (Maybe Indexed)

data Indexed =
  Indexed Integer
          Integer

location :: Parser Location
location = Location <$> uuidParser <*> optional indexedParser

indexedParser :: Parser Indexed
indexedParser = Indexed <$> indexParser <*> remainderParser

uuidParser :: Parser String
uuidParser = argument str (metavar "UUID" <> help "ID you're trying to hash")

indexParser :: Parser Integer
indexParser = argument auto (metavar "INT" <> help "Index you're looking for")

remainderParser :: Parser Integer
remainderParser =
  option
    auto
    (long "remainder" <> short 'r' <> showDefault <> value 100 <> metavar "INT" <>
     help "Remainder you want to use for your index")
