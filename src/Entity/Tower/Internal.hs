module Entity.Tower.Internal ( module Apecs 
                             , module Assets.Sprites.Towers
                             , module Game 
                             , module Game.World 
                             , module Linear 
                             , module Raylib.Core.Textures 
                             , module Raylib.Util.Colors
                             , mkTowerRenderer
                             , createTower
                             ) where

import Apecs

import Assets.Sprites.Towers

import Game
import Game.World

import Linear

import Raylib.Core.Textures
import Raylib.Types.Core.Textures
import Raylib.Util.Colors

mkTowerRenderer :: Texture -> Renderer
mkTowerRenderer img = Renderer $ \pos rot -> drawTextureEx img pos rot 1 white

createTower :: Texture -> V2 Float -> Game ()
createTower img pos = newEntity_ (Pos pos, Rot 0, mkTowerRenderer img)
