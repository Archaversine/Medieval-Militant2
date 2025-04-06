module Entity.Projectile where

import Apecs

import Assets.Sprites.Projectiles

import Game
import Game.World

import Linear

import Raylib.Core.Textures
import Raylib.Util.Colors

defaultProjectileRenderer :: V2 Float -> Float -> IO ()
defaultProjectileRenderer pos rot = drawTextureEx image_Sprite_Projectiles_ArrowDefault pos rot 1 white

createDefaultProjectile :: V2 Float -> V2 Float -> Game ()
createDefaultProjectile p dir = newEntity_ (Pos p, Vel dir, Rot (unangle dir * 180/pi + 90), Renderer defaultProjectileRenderer)
