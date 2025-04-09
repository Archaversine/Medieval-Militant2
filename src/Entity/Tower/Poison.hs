module Entity.Tower.Poison where

import Entity.Tower.Internal 

createPoisonTower :: V2 Float -> Game () 
createPoisonTower = createTower image_Sprite_Tower_Poison
