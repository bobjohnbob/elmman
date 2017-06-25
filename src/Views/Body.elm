module Views.Body exposing (..)

import Html exposing (Html, h1, div, text)
import GLOBALS exposing (playAreaSize)
import Types exposing (Model, Range)
import Views.PlayArea


view : Model -> Html msg
view model =
    let
        ( width, height ) =
            playAreaSize
    in
        div []
            [ h1 [] [ text "ElmMan!" ]
            , Views.PlayArea.render width height model
            ]
