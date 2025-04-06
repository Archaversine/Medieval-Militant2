module Main where

import Control.Monad.IO.Class

import Game
import Game.World

import Raylib.Core
import Raylib.Util
import Raylib.Util.Colors

gameInit :: Game ()
gameInit = pure ()

gameFrame :: Game () 
gameFrame = tick *> liftIO beginDrawing *> render *> liftIO endDrawing

tick :: Game () 
tick = pure ()

render :: Game () 
render = liftIO $ clearBackground black 

main :: IO ()
main = do 
    let width  = 800 
        height = 600
        title  = "Medieval Militant"
        fps    = 60
    
    initWindowUnmanaged width height title
    setTargetFPS fps

    let s = GameState {windowWidth = width, windowHeight = height}

    w <- initWorld

    runGame gameInit w s
    
    -- game loop
    whileWindowOpen0 $ do 
        runGame gameFrame w s
