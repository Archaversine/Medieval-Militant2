module Entity.Unit.Demoman where

import Entity.Unit.Internal

createUnitDemoman :: V2 Float -> V2 Float -> Game ()
createUnitDemoman = createUnit image_Sprite_Unit_DemomanV2
