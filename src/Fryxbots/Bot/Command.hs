module Fryxbots.Bot.Command
  ( Command(..)
  ) where

import Fryxbots.Beacon (BeaconKind)

data Command = Idle
             | RotateLeft
             | RotateRight
             | MoveForward
             | DropBeacon BeaconKind
             | DestroyBeacon
             | PickUpFossil
             | DropFossil
