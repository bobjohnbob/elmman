module Init.Player exposing (..)

import Types exposing (PlayerModel, Direction(Right))


init : PlayerModel
init =
    { direction = Right
    , location = ( 250, 450 )
    , moving = False
    }
