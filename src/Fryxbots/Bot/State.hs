module Fryxbots.Bot.State
  ( State(..)
  , empty
  , memStore
  , memRead
  , setCommand
  ) where

import           Fryxbots.Bot.Command
import           Fryxbots.Bot.Facing
import           Data.Map (Map)
import qualified Data.Map as Map

data State = State
  { command :: Command
  , memory  :: Map String Int
  }

empty :: State
empty = State
  { command = Idle
  , memory = Map.empty
  }

setCommand :: Command -> State -> State
setCommand cmd st = st { command = cmd }

memStore :: String -> Int -> State -> State
memStore varName val st =
  st { memory = Map.insert varName val $ memory st }

memRead :: String -> State -> Maybe Int
memRead varName = Map.lookup varName . memory
