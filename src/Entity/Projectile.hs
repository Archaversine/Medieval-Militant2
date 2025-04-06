module Entity.Projectile where

import Apecs

import Assets.Sprites.Projectiles

import Game
import Game.World

import Linear

import Raylib.Core.Textures
import Raylib.Util.Colors

defaultProjectileRenderer :: V2 Float -> IO ()
defaultProjectileRenderer (V2 x y) = drawTexture image_Sprite_Projectiles_ArrowDefault (round x) (round y) white

createDefaultProjectile :: V2 Float -> V2 Float -> Game ()
createDefaultProjectile p dir = newEntity_ (Pos p, Vel dir, Renderer defaultProjectileRenderer)
