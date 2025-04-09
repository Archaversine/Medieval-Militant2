module Entity.Tower.Sniper where

import Entity.Tower.Internal 

createSniper :: V2 Float -> Game () 
createSniper = createTower image_Sprite_Tower_Sniper
