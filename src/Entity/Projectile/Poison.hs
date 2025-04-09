module Entity.Projectile.Poison where

import Entity.Projectile.Internal

createPoisonProj :: V2 Float -> V2 Float -> Game ()
createPoisonProj = createProjectile image_Sprite_Projectiles_PoisonBall
