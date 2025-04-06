{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}

module Game.World where

import Apecs

import Linear

newtype Pos = Pos (V2 Float)
newtype Vel = Vel (V2 Float)
newtype Rot = Rot Float -- rotation (degrees because apparently nobody understand radians)
newtype Renderer = Renderer (V2 Float -> Float -> IO ())

makeWorldAndComponents "World" [''Pos, ''Vel, ''Rot, ''Renderer]

