{-# LANGUAGE MultiWayIf #-}

module Main where

import Apecs

import Control.Monad

import Entity.Tower
import Entity.Projectile

import Game
import Game.World

import Linear

import Raylib.Core
import Raylib.Core.Textures
import Raylib.Types.Core
import Raylib.Util
import Raylib.Util.Colors

-- | Game initialization function
--
-- This function will only run once at the start of the game. 
-- This is useful for initializing data
gameInit :: Game ()
gameInit = do 
    let towers = [ createAcceleration 
                 , createAttractor    
                 , createFireTower
                 , createLightning    
                 , createPoisonTower       
                 , createSniper       
                 , createStandard     
                 , createSupport      
                 , createTemporal     
                 ]

    -- Coordinates to place towers at
    let xs     = [130, 130 + 130 .. 650]
        ys     = [130, 130 + 130 .. 450]
        coords = [V2 x y | x <- xs, y <- ys]

    -- spawn all towers with automatic spacing
    zipWithM_ id towers coords

    createArrow      (V2 0 30) (V2 2 0)
    createFireProj   (V2 0 60) (V2 2 0)
    createPoisonProj (V2 0 90) (V2 2 0)

-- | Game Frame Function
-- 
-- Function which performs all calculations in a game frame
--
-- You will likely never need to modify this function
gameFrame :: Game () 
gameFrame = tick *> liftIO beginDrawing *> render *> liftIO endDrawing

-- | Game Tick/Update Function
--
-- All logical updates should go here. 
-- This function runs once per frame
--
-- Such as: updating position, health, etc.
tick :: Game () 
tick = do 
    delta <- liftIO getFrameTime -- Delta time (in seconds)
    
    cmap $ \(Pos p, Vel dir) -> Pos (p + dir) -- Position is updated by velocity (assumes already normalized)

    -- Update Animators:
    -- Updates @animNext@ by delta time
    cmapM $ \(Animator sheet frames speed next) -> do 
        return (Animator sheet frames speed (next - delta))

    -- Update animation frame and reset @animNext@ if less than 0
    cmapM $ \(Animator sheet frames speed next) -> if
        | next <= 0 -> return (Animator sheet (drop 1 frames) speed speed)
        | otherwise -> return (Animator sheet frames speed next)

    -- Update entities with a lifetime
    cmap $ \(Lifetime t) -> Lifetime (t - delta)

-- | Game Render Function
--
-- All rendering should go here.
-- 
-- NOTE: Items that are rendered first will render at the bottom of the screen
render :: Game () 
render = do 
    liftIO $ clearBackground darkGray
    renderBG *> renderG *> renderTop -- render entities in order

-- | Render all entities on the background
--
-- Renderers are rendered before Animators
renderBG :: Game ()
renderBG = do 
    cmapM_ $ \(Pos p, Rot theta, RenderBG, Renderer f) -> liftIO (f p theta)
    cmapM_ $ \(Pos p, Rot theta, RenderBG, a@(Animator {})) -> renderAnimator p theta a

-- | Render all entities on the ground
--
-- Renderers are rendered before Animators
renderG :: Game () 
renderG = do 
    cmapM_ $ \(Pos p, Rot theta, RenderG, Renderer f) -> liftIO (f p theta)
    cmapM_ $ \(Pos p, Rot theta, RenderG, a@(Animator {})) -> renderAnimator p theta a

-- | Render all entities above the ground
--
-- Renderers are rendered before Animators
renderTop :: Game ()
renderTop = do 
    cmapM_ $ \(Pos p, Rot theta, RenderTop, Renderer f) -> liftIO (f p theta)
    cmapM_ $ \(Pos p, Rot theta, RenderTop, a@(Animator {})) -> renderAnimator p theta a

-- | Render an animated sprite
renderAnimator :: V2 Float -> Float -> Animator -> Game ()
renderAnimator _ _ (Animator _ [] _ _) = pure () -- Don't render when out of frames
renderAnimator (V2 x y) theta (Animator sheet (src:_) _ _) = do 
    let width  = rectangle'width src
        height = rectangle'height src
        dest   = Rectangle x y width height

    liftIO $ drawTexturePro sheet src dest (V2 width height / 2) theta white

main :: IO ()
main = do 
    let width  = 800 
        height = 600
        title  = "Medieval Militant"
        fps    = 60
    
    initWindowUnmanaged width height title
    setWindowState [WindowResizable]
    setTargetFPS fps

    let s = GameState {windowWidth = width, windowHeight = height}

    -- `initWorld` is automatically generated by the `makeWorldAndComponents` function 
    w <- initWorld

    -- run the init function
    runGame gameInit w s
    
    -- game loop
    whileWindowOpen0 $ do 
        runGame gameFrame w s
