-- An example controller which randomly moves around,
-- picking up and dropping off fossils.

module Fryxbots.Example.RandomController
  ( RandomController(..)
  , mkRandomController
  ) where

import Fryxbots.Bot.Command
import Fryxbots.Bot.Controller
import Fryxbots.Bot.State
import System.Random

data RandomController = RandomController
  { botId :: Int
  , randGen :: StdGen
  }

mkRandomController :: RandomController
mkRandomController = RandomController
  { botId = -1
  , randGen = mkStdGen 0
  }

instance Controller RandomController where

  initialize controller botId _ = controller { botId = botId
                                             , randGen = mkStdGen botId
                                             }

  stepBot controller facing sensing hasFossil state =
    let (randInt, randGen') = randomR (0, 4) (randGen controller) :: (Int, StdGen)
        controller' = controller { randGen = randGen' }
        command = if randInt == 0 then RotateLeft
             else if randInt == 1 then RotateRight
             else if randInt == 2 then MoveForward
             else if randInt == 3 then PickUpFossil
             else if randInt == 4 then DropFossil
             else Idle
    in (controller', setCommand command state)
