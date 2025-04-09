module Entity.Tower.Acceleration where

import Entity.Tower.Internal 

createAcceleration :: V2 Float -> Game () 
createAcceleration = createTower image_Sprite_Tower_Acceleration
