module Entity.Unit.Knight where

import Entity.Unit.Internal

createUnitKnight :: V2 Float -> V2 Float -> Game ()
createUnitKnight = createUnit image_Sprite_Unit_KnightDefault
