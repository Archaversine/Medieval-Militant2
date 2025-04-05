module Main where

import Assets.Sprites.Towers

import Raylib.Core
import Raylib.Core.Textures
import Raylib.Util
import Raylib.Util.Colors

main :: IO ()
main = do 
    let width  = 800 
        height = 600
        title  = "Medieval Militant"
        fps    = 60
    
    initWindowUnmanaged width height title
    setTargetFPS fps

    tower <- loadImage_GrandTower -- automatically generated image loader
    
    -- game loop
    whileWindowOpen0 $ do 
        beginDrawing
        clearBackground black
        drawTexture tower 30 30 white
        endDrawing
