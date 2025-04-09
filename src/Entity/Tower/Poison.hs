module Entity.Tower.Poison where

import Entity.Tower.Internal 

createPoison :: V2 Float -> Game () 
createPoison = createTower image_Sprite_Tower_Poison
