module Main where

import Apecs

import Entity.Tower

import Game
import Game.World

import Linear

import Raylib.Core
import Raylib.Util
import Raylib.Util.Colors

gameInit :: Game ()
gameInit = do 
    createDefaultTower (V2 30 30)
    createDefaultTower (V2 160 160)

gameFrame :: Game () 
gameFrame = tick *> liftIO beginDrawing *> render *> liftIO endDrawing

tick :: Game () 
tick = pure ()

render :: Game () 
render = do 
    liftIO $ clearBackground darkGray
    cmapM_ $ \(Pos p, Renderer f) -> liftIO (f p) -- render everything that has a position and a renderer

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
