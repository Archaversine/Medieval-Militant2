{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}

module Game.World where

import Apecs

import Linear

newtype Pos = Pos (V2 Float)
newtype Renderer = Renderer (V2 Float -> IO ())

makeWorldAndComponents "World" [''Pos, ''Renderer]

