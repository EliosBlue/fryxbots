module BotCommand
  ( BotCommand(..)
  ) where

import Beacon (BeaconKind)

data BotCommand = Idle
                | RotateLeft
                | RotateRight
                | MoveForward
                | DropBeacon BeaconKind
                | DestroyBeacon
                | PickUpFossil
                | DropFossil
