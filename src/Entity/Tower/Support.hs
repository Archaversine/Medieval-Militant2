module Entity.Tower.Support where

import Entity.Tower.Internal 

createSupport :: V2 Float -> Game () 
createSupport = createTower image_Sprite_Tower_Support
