module Fryxbots.Bot.Facing
  ( Facing(..)
  , adjacent
  , rotateLeft
  , rotateRight
  ) where

import Fryxbots.Pos

data Facing = NorthEast
            | East
            | SouthEast
            | SouthWest
            | West
            | NorthWest

rotateLeft :: Facing -> Facing
rotateLeft facing = case facing of
  NorthEast -> NorthWest
  East -> NorthEast
  SouthEast -> East
  SouthWest -> SouthEast
  West -> SouthWest
  NorthWest -> West

rotateRight :: Facing -> Facing
rotateRight facing = case facing of
  NorthEast -> East
  East -> SouthEast
  SouthEast -> SouthWest
  SouthWest -> West
  West -> NorthWest
  NorthWest -> NorthEast

adjacent :: Facing -> Pos -> Pos
adjacent facing pos = case facing of
  NorthEast -> pos { posX = (posX pos) + 1
                   , posY = (posY pos) - 1 }
  East      -> pos { posX = (posX pos) + 1 }
  SouthEast -> pos { posX = (posX pos) + 1
                   , posY = (posY pos) + 1 }
  SouthWest -> pos { posX = (posX pos) - 1
                   , posY = (posY pos) + 1 }
  West      -> pos { posX = (posX pos) - 1 }
  NorthWest -> pos { posX = (posX pos) - 1
                   , posY = (posY pos) - 1 }
