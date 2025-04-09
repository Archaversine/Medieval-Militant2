{-# LANGUAGE TemplateHaskell #-}

module Assets.ImageLoader (makeImageLoader, makeImageLoaders) where

import Data.Char

import Language.Haskell.TH

import Raylib.Core.Textures

import System.Directory
import System.FilePath
import System.IO.Unsafe

pathToImageLoaderName :: FilePath -> String
pathToImageLoaderName xs = "image_" ++ filter f (takeBaseName xs)
    where f c = isAlphaNum c || c == '_'

-- | Macro to generate a function to load a specified image
--
-- Example: `makeImageLoader "assets/sprite.png`
--
-- This will generate the function `loadImage_sprite :: IO Image`
makeImageLoader :: FilePath -> Q [Dec]
makeImageLoader path = do 
    funcBody <- [| unsafePerformIO $ loadTexture $(stringE path) |]
    
    let funcName = mkName (pathToImageLoaderName path)
        funcPrag = PragmaD (InlineP funcName NoInline FunLike AllPhases)
        funcTy   = SigD funcName (ConT $ mkName "Raylib.Types.Core.Textures.Texture")
        funcDef  = FunD funcName [Clause [] (NormalB funcBody) []]

    return [funcPrag, funcTy, funcDef]

-- | Given a directory, automatically call @makeImageLoader@ on all 
-- files in that directory with the matching extension.
--
-- Example: `makeImageLoaders "assets/sprites" ".png"`
makeImageLoaders :: FilePath -> String -> Q [Dec]
makeImageLoaders dir ext = do 
    imgs <- runIO (getDirectoryContents dir)
    concat <$> traverse makeImageLoader [dir </> i | i <- imgs, takeExtension i == ext]

