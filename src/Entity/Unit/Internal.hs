module Entity.Unit.Internal ( module Assets.Sprites.Units
                            , module Game
                            , module Linear
                            , createUnit
                            , createAnimatedUnit
                            ) where
import Data.Fixed (mod')

import Apecs

import Assets.Sprites.Units

import Game
import Game.World

import Linear

import Raylib.Types.Core.Textures

import Utils.Rendering

-- | Create a unit at a given position, currently stationary, working on figuring out having a goal position, I want the basic out before the functional
createUnit :: Texture -> V2 Float -> V2 Float -> Game ()
createUnit img pos dir = if (mod' (unangle dir * 180/pi + 90) 360) <= 180 then newEntity_ (Pos pos, Rot 0, RenderTop, defaultRenderer img)
                         else newEntity_ (Pos pos, Rot 180, RenderTop, defaultRenderer img)

-- | Create a unit at a given position but with an @Animator@ instead of a @Renderer@
createAnimatedUnit :: Animator -> V2 Float -> V2 Float -> Game ()
createAnimatedUnit animator pos dir = if (mod' (unangle dir * 180/pi + 90) 360) <= 180 then newEntity_ (Pos pos, Rot 0, RenderTop, animator)
                                      else newEntity_ (Pos pos, Rot 0, RenderTop, animator)
