module Main where

import Raylib.Core
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
    
    -- game loop
    whileWindowOpen0 $ do 
        beginDrawing
        clearBackground black
        endDrawing
