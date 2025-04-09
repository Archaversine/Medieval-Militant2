{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}

module Game.World where

import Apecs

import Linear

-- List of components an entity can have
-- NOTE: An entity does not have to have any of these components
newtype Pos = Pos (V2 Float)
newtype Vel = Vel (V2 Float)
newtype Rot = Rot Float -- rotation (degrees because apparently nobody understand radians)
newtype Renderer = Renderer (V2 Float -> Float -> IO ())

-- Automatically generates the world type
-- The exact implementation isn't relevant, it's essentially 
-- a list of references to maps that map entity IDs to their corresponding components
makeWorldAndComponents "World" [''Pos, ''Vel, ''Rot, ''Renderer]

