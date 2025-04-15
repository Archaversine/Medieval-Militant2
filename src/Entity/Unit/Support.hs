module Entity.Unit.Support where

import Entity.Unit.Internal

createUnitSupport :: V2 Float -> V2 Float -> Game ()
createUnitSupport = createUnit image_Sprite_Unit_SupportUnit
