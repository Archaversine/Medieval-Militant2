module Entity.Tower.Attractor where

import Entity.Tower.Internal 

createAttractor :: V2 Float -> Game () 
createAttractor = createTower image_Sprite_Tower_Attract
