module Entity.Tower.Internal ( module Apecs 
                             , module Assets.Sprites.Towers
                             , module Game 
                             , module Game.World 
                             , module Linear 
                             , module Raylib.Core.Textures 
                             , module Raylib.Util.Colors
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

import Utils.Rendering

-- | Create a tower with the default renderer at a given position
createTower :: Texture -> V2 Float -> Game ()
createTower img pos = newEntity_ (Pos pos, Rot 0, RenderG, defaultRenderer img)

-- | Create a tower at a given position but with an @Animator@ instead of a @Renderer@
createAnimatedTower :: Animator -> V2 Float -> Game () 
createAnimatedTower animator pos = newEntity_ (Pos pos, Rot 0, RenderG, animator)
