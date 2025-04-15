module Entity.Unit.Sniper where

import Entity.Unit.Internal

createUnitSniper :: V2 Float -> V2 Float -> Game ()
createUnitSniper = createUnit image_Sprite_Unit_SniperDefault
