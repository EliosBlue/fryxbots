module Main (main) where

import Fryxbots.Example.RandomController
import Fryxbots.Simulator

main :: IO ()
main =
  let blueController = mkRandomController
      goldController = mkRandomController
  in runSimulator "worlds/example0.world" blueController goldController
