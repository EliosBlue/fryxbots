module Main (main) where

import Fryxbots.Simulator
import RandController

main :: IO ()
main =
  let blueController = mkRandController
      goldController = mkRandController
  in runSimulator blueController goldController
