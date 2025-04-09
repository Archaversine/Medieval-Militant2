module Entity.Tower where

import Apecs

import Assets.Sprites.Towers

import Game
import Game.World

import Linear

import Raylib.Core.Textures
import Raylib.Util.Colors

-- TODO: Eventually separate into separate functions for each tower type
-- | Default renderer for towers
--
-- This function takes in a position and a rotation, and then renders 
-- a default tower
defaultTowerRenderer :: V2 Float -> Float -> IO ()
defaultTowerRenderer pos rot = drawTextureEx image_Sprite_Tower_DefaultV2 pos rot 1 white

-- | Create a default tower given position and velocity
createDefaultTower :: V2 Float -> Game ()
createDefaultTower p = newEntity_ (Pos p, Rot 0, Renderer defaultTowerRenderer)

