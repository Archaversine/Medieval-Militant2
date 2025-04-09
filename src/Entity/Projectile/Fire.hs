module Entity.Projectile.Fire where

import Entity.Projectile.Internal

createFireProj :: V2 Float -> V2 Float -> Game ()
createFireProj = createProjectile image_Sprite_Projectiles_FireBall
