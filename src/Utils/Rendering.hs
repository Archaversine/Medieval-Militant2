module Utils.Rendering where

import Game.World

import Linear

import Raylib.Core.Textures
import Raylib.Types
import Raylib.Util.Colors

-- | Default renderer
--
-- Creates a @Renderer@ that:
-- Renders an image at a given position with a given rotation
defaultRenderer :: Texture -> Renderer
defaultRenderer img = Renderer $ \(V2 x y) theta -> do 
    let width  = fromIntegral (texture'width img)
        height = fromIntegral (texture'height img)
        src    = Rectangle 0 0 width height 
        dest   = Rectangle x y width height 

    drawTexturePro img src dest (V2 width height / 2) theta white
