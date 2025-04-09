module Game where

import Apecs

import Control.Arrow
import Control.Monad.Reader

import Game.World

-- | Holds all relevant data that may be used by game functions
-- 
-- NOTE: Since @Game@ uses @ReaderT@, these values will not be able to change.
-- If you are looking to add values that can change, see @MVar@ or @TVar@ (these support parallelism)
data GameState = GameState {
    windowWidth  :: Int, 
    windowHeight :: Int
}

-- | The Game Monad
--
-- Has a reference to a game state, the world, and can perform IO actions
type Game = SystemT World (ReaderT GameState IO)

-- | Helper function to access the window width in a game action
getWindowWidth :: Game Int 
getWindowWidth = lift $ asks windowWidth

-- | Helper function to access the window height in a game action
getWindowHeight :: Game Int 
getWindowHeight = lift $ asks windowHeight

-- | Helper function to access the window width and height in a game action
getWindowSize :: Game (Int, Int)
getWindowSize = lift $ asks (windowWidth &&& windowHeight)

-- | Given a World and GameState, convert @Game a@ into @IO a@
--
-- Effectively "running" the game action
runGame :: Game a -> World -> GameState -> IO a 
runGame g = runReaderT . runSystem g
