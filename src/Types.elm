module Types exposing (..)

import Time exposing (Time)
import Keyboard exposing (KeyCode)


type Direction
    = Up
    | Down
    | Left
    | Right


type KeyAction
    = MoveUp
    | MoveDown
    | MoveLeft
    | MoveRight
    | NoKeyAction


type alias Model =
    { time : Time
    , player : PlayerModel
    }


type Msg
    = Tick Time
    | Tock Time
    | Press KeyCode


type alias PlayerModel =
    { direction : Direction
    , location : ( Float, Float )
    }


type alias Range =
    ( Float, Float )
