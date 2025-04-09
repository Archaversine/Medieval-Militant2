module Entity.Projectile where

import Apecs

import Assets.Sprites.Projectiles

import Game
import Game.World

import Linear

import Raylib.Core.Textures
import Raylib.Util.Colors

-- | Default renderer for projectiles
--
-- This function takes in a position and a rotation, and then renders 
-- a default projectile
defaultProjectileRenderer :: V2 Float -> Float -> IO ()
defaultProjectileRenderer pos rot = drawTextureEx image_Sprite_Projectiles_ArrowDefault pos rot 1 white

-- | Create a default projectile given position and velocity
createDefaultProjectile :: V2 Float -> V2 Float -> Game ()
createDefaultProjectile p dir = newEntity_ (Pos p, Vel dir, Rot (unangle dir * 180/pi + 90), RenderTop, Renderer defaultProjectileRenderer)
