module Views.Map exposing (..)

import GLOBALS exposing (backgroundColor, playAreaSize)
import Svg exposing (Svg, g, path, rect)
import Svg.Attributes exposing (d, fill, x, y, width, height)
import Svg.Path exposing (pathToString, lineTo, subpath, startAt, closed)


render : Svg msg
render =
    let
        ( areaWidth, areaHeight ) =
            playAreaSize
    in
        g []
            [ rect
                [ fill backgroundColor
                , width (toString areaWidth)
                , height (toString areaHeight)
                , x (toString 0)
                , y (toString 0)
                ]
                []
            ]
