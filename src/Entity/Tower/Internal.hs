module Entity.Tower.Internal ( module Apecs 
                             , module Assets.Sprites.Towers
                             , module Game 
                             , module Game.World 
                             , module Linear 
                             , module Raylib.Core.Textures 
                             , module Raylib.Util.Colors
                             , mkTowerRenderer
                             , createTower
                             , createAnimatedTower
                             ) where

import Apecs

import Assets.Sprites.Towers

import Game
import Game.World

import Linear

import Raylib.Core.Textures
import Raylib.Types
import Raylib.Util.Colors

-- | Create a tower renderer function for a given tower
--
-- NOTE: Sets the rotation origin at the center of the sprite
mkTowerRenderer :: Texture -> Renderer
mkTowerRenderer img = Renderer $ \(V2 x y) rot -> do 
                             let width  = fromIntegral (texture'width img) 
                                 height = fromIntegral (texture'height img)
                                 src    = Rectangle 0 0 width height
                                 dest   = Rectangle x y width height
                             
                             drawTexturePro img src dest (V2 width height / 2) rot white

-- | Create a tower with the default renderer at a given position
createTower :: Texture -> V2 Float -> Game ()
createTower img pos = newEntity_ (Pos pos, Rot 0, RenderG, mkTowerRenderer img)

-- | Create a tower at a given position but with an @Animator@ instead of a @Renderer@
createAnimatedTower :: Animator -> V2 Float -> Game () 
createAnimatedTower animator pos = newEntity_ (Pos pos, Rot 0, RenderG, animator)
