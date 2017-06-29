module Views.Body exposing (..)

import Html exposing (Html, h1, div, text)
import GLOBALS exposing (play_area_size)
import Types exposing (Model, Range)
import Views.PlayArea


view : Model -> Html msg
view model =
    let
        ( width, height ) =
            play_area_size
    in
        div []
            [ h1 [] [ text "ElmMan!" ]
            , Views.PlayArea.render (toString width) (toString height) model
            ]
