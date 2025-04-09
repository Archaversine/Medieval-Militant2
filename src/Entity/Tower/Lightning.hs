module Entity.Tower.Lightning where

import Entity.Tower.Internal 

createLightning :: V2 Float -> Game () 
createLightning = createTower image_Sprite_Tower_Lightning
