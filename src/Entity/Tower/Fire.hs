module Entity.Tower.Fire where

import Entity.Tower.Internal 

createFire :: V2 Float -> Game () 
createFire = createTower image_Sprite_Tower_Fire
