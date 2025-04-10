module Entity.Tower.Acceleration where

import Entity.Tower.Internal 

import Raylib.Types

createAcceleration :: V2 Float -> Game () 
createAcceleration = createAnimatedTower (newAnimator sheet accelAnimation speed)
    where accelAnimation = cycle [Rectangle (x * size) 0 size size | x <- [0 .. frames - 1]]
          sheet  = image_Sprite_Tower_Acceleration_AccelerateSheet
          speed  = 0.05
          size   = 120
          frames = 12
    
