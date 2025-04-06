module Game where

import Apecs

import Control.Arrow
import Control.Monad.Reader

import Game.World

data GameState = GameState {
    windowWidth  :: Int, 
    windowHeight :: Int
}

type Game = SystemT World (ReaderT GameState IO)

getWindowWidth :: Game Int 
getWindowWidth = lift $ asks windowWidth

getWindowHeight :: Game Int 
getWindowHeight = lift $ asks windowHeight

getWindowSize :: Game (Int, Int)
getWindowSize = lift $ asks (windowWidth &&& windowHeight)

runGame :: Game a -> World -> GameState -> IO a 
runGame g = runReaderT . runSystem g
