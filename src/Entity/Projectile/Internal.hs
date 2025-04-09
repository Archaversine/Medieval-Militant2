module Entity.Projectile.Internal ( module Assets.Sprites.Projectiles 
                                  , module Game
                                  , module Linear
                                  , createProjectile 
                                  , createAnimatedProjectile 
                                  ) where

import Apecs

import Assets.Sprites.Projectiles

import Game
import Game.World

import Linear

import Raylib.Types.Core.Textures

import Utils.Rendering

-- | Create a projectile at a given position
createProjectile :: Texture -> V2 Float -> V2 Float -> Game ()
createProjectile img pos dir = newEntity_ (Pos pos, Vel dir, Rot (unangle dir * 180/pi + 90), RenderTop, defaultRenderer img)

-- | Create a projectile at a given position but with an @Animator@ instead of a @Renderer@
createAnimatedProjectile :: Animator -> V2 Float -> V2 Float -> Game ()
createAnimatedProjectile animator pos dir = newEntity_ (Pos pos, Vel dir, Rot (unangle dir * 180/pi + 90), RenderTop, animator)

