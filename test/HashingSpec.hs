{-# LANGUAGE OverloadedStrings #-}

module HashingSpec
  ( main
  , spec
  ) where

import           Data.Digest.Pure.MD5 (md5)
import           Test.Hspec

import           Hashing

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "calcHash" $
    it "will give a full md5 digest" $
    calcHash "a14bc4ee-2a6e-4066-87de-720803db73bb" 597 100 `shouldBe`
    md5 "a14bc4ee-2a6e-4066-87de-720803db73bb:97"
  describe "simpleHash" $
    it "will give a full md5 digest" $
    simpleHash "a14bc4ee-2a6e-4066-87de-720803db73bb" `shouldBe`
    md5 "a14bc4ee-2a6e-4066-87de-720803db73bb"
