module Main exposing (..)

import Html
import Init.All
import Subscriptions exposing (subscriptions)
import Updates.All exposing (update)
import Views.Body exposing (view)
import Types exposing (Model, Msg)


main : Program Never Model Msg
main =
    Html.program
        { init = ( Init.All.init, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
