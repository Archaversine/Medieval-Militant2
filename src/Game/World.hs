{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}

module Game.World where

import Apecs

import Linear

newtype Pos = Pos (V2 Float)

makeWorldAndComponents "World" [''Pos]

