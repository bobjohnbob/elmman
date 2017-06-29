module Views.Map exposing (..)

import GLOBALS exposing (background_color, play_area_size)
import Svg exposing (Svg, g, path, rect)
import Svg.Attributes exposing (d, fill, x, y, width, height)
import Svg.Path exposing (pathToString, lineTo, subpath, startAt, closed)


render : Svg msg
render =
    let
        ( areaWidth, areaHeight ) =
            play_area_size
    in
        g []
            [ rect
                [ fill background_color
                , width (toString areaWidth)
                , height (toString areaHeight)
                , x (toString 0)
                , y (toString 0)
                ]
                []
            ]
