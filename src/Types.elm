module Types exposing (..)

import Time exposing (Time)


type Direction
    = Up
    | Down
    | Left
    | Right


type alias Model =
    { time : Time
    , player : PlayerModel
    }


type alias PlayerModel =
    { direction : Direction
    , location : ( Float, Float )
    }


type alias Range =
    ( Float, Float )


type Msg
    = Tick Time
    | Tock Time
