module Entity.Tower.Temporal where

import Entity.Tower.Internal 

import Raylib.Types

createTemporal :: V2 Float -> Game () 
createTemporal = createAnimatedTower (newAnimator sheet temporalAnimation speed)
    where temporalAnimation = cycle [Rectangle (x * size) 0 size size | x <- [0 .. frames - 1]]
          sheet  = image_Sprite_Tower_Temporal_AnimationSheet
          speed  = 0.05
          size   = 120 
          frames = 12
