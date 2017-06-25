module Subscriptions exposing (..)

import AnimationFrame exposing (times, diffs)
import Types exposing (Model, Msg(Tick, Tock))


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ times Tick
        , diffs Tock
        ]
