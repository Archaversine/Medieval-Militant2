module Entity.Tower.Fire where

import Entity.Tower.Internal 

createFireTower :: V2 Float -> Game () 
createFireTower = createTower image_Sprite_Tower_Fire
