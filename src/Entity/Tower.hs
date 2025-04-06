module Entity.Tower where

import Apecs

import Assets.Sprites.Towers

import Game
import Game.World

import Linear

import Raylib.Core.Textures
import Raylib.Util.Colors

-- TODO: Eventually separate into separate functions for each tower type
defaultTowerRenderer :: V2 Float -> IO ()
defaultTowerRenderer (V2 x y) = drawTexture image_Sprite_Tower_DefaultV2 (round x) (round y) white

createDefaultTower :: V2 Float -> Game ()
createDefaultTower p = newEntity_ (Pos p, Renderer defaultTowerRenderer)

