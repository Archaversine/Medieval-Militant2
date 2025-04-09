module Entity.Projectile.Arrow where

import Entity.Projectile.Internal

createArrow :: V2 Float -> V2 Float -> Game ()
createArrow = createProjectile image_Sprite_Projectiles_ArrowDefault
