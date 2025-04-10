{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}

module Game.World where

import Apecs

import Linear

import Raylib.Types

-- List of components an entity can have
-- NOTE: An entity does not have to have any of these components
newtype Pos = Pos (V2 Float)
newtype Vel = Vel (V2 Float)
newtype Rot = Rot Float -- rotation (degrees because apparently nobody understand radians)
newtype Renderer = Renderer (V2 Float -> Float -> IO ())
newtype Lifetime = Lifetime Float -- Time an entity should live for (in seconds)

-- NOTE: If your entity needs to be rendered, it MUST have one of these, 
-- otherwise it will not be rendered
--
-- If an entity as more than one of these, then it will be rendered multiple times
--
-- TODO: Represent this as an ADT to prevent entities from having multiple render layers
data RenderBG  = RenderBG  -- for entities to be rendered on the background (e.g. grass)
data RenderG   = RenderG   -- for entities to be rendered on the ground (e.g. units, towers, etc.)
data RenderTop = RenderTop -- for entities to be rendered above the ground (e.g. projectiles)

-- | Allows entities to have animations instead of a single still image (via @Renderer@)
--
-- NOTE: Do not use with @Renderer@
data Animator = Animator { 
    animSheet  :: !Texture,     -- ^ The Sprite sheet
    animFrames :: ![Rectangle], -- ^ This should be an infinite list (use @cycle@ to easily create one)
    animSpeed  :: !Float,       -- ^ In seconds
    animNext   :: !Float        -- ^ Time till next frame (in seconds). You probably don't want to touch this
}

-- | Create a new animator and automatically set @animNext@
newAnimator :: Texture -> [Rectangle] -> Float -> Animator
newAnimator sheet frames speed = Animator sheet frames speed speed

-- Automatically generates the world type
-- The exact implementation isn't relevant, it's essentially 
-- a list of references to maps that map entity IDs to their corresponding components
makeWorldAndComponents "World" [ ''Pos
                               , ''Vel
                               , ''Rot
                               , ''Renderer
                               , ''Animator
                               , ''RenderBG 
                               , ''RenderG 
                               , ''RenderTop
                               , ''Lifetime
                               ]

