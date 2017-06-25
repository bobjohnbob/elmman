module Init.All exposing (..)

import Types exposing (Model)
import Init.Player


init : Model
init =
    { time = 0
    , player = Init.Player.init
    }
