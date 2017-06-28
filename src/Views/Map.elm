module Views.Map exposing (..)

import GLOBALS exposing (backgroundColor, playAreaSize)
import Svg exposing (Svg, g, path)
import Svg.Attributes exposing (d, fill)
import Svg.Path exposing (pathToString, lineTo, subpath, startAt, closed)


render : Svg msg
render =
    let
        ( width, height ) =
            playAreaSize
    in
        g []
            [ path
                [ d <|
                    pathToString
                        [ subpath (startAt ( 0, 0 ))
                            closed
                            [ lineTo ( width, 0 )
                            , lineTo ( width, height )
                            , lineTo ( 0, height )
                            ]
                        ]
                , fill backgroundColor
                ]
                []
            ]
