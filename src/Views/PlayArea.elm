module Views.PlayArea exposing (..)

import Html exposing (Html)
import Svg exposing (svg)
import Svg.Attributes exposing (width, height, viewBox)
import Types exposing (Model)
import Views.Player
import Views.Map


render : String -> String -> Model -> Html msg
render w h model =
    svg
        [ width w, height h, viewBox ("0 0 " ++ w ++ " " ++ h) ]
        [ Views.Map.render
        , Views.Player.render model
        ]
