module Views.Player exposing (..)

import Time exposing (Time, inMilliseconds)
import Svg exposing (Svg, g, path)
import Svg.Attributes
    exposing
        ( fill
        , d
        )
import Svg.Path
    exposing
        ( Point
        , pathToString
        , arcBy
        , subpath
        , closed
        , lineBy
        , startAt
        , clockwise
        , largestArc
        )
import AnimationHelpers exposing (calculateAnimation)
import Types exposing (Model)
import GLOBALS exposing (character_radius)


render : Model -> Svg msg
render model =
    let
        cycleTime =
            500

        maxOpen =
            90

        frameCount =
            calculateAnimation (model.time |> inMilliseconds |> round) cycleTime ( 0, maxOpen * 2 )

        openness =
            if frameCount > maxOpen then
                maxOpen - toFloat (round (frameCount) % maxOpen)
            else
                frameCount
    in
        pacman ( 250, 450 ) (degrees openness)


pacman : Point -> Float -> Svg msg
pacman position openness =
    let
        opp =
            character_radius * sin (openness / 2)

        adj =
            character_radius * cos (openness / 2)

        radiuses =
            ( character_radius, character_radius )
    in
        g []
            [ path
                [ d <|
                    pathToString
                        [ (subpath (startAt position)
                            closed
                            [ lineBy ( adj, opp )
                            , arcBy radiuses 0 ( largestArc, clockwise ) ( 0, -(opp * 2) )
                            , lineBy ( -adj, opp )
                            ]
                          )
                        ]
                , fill "#ffff00"
                ]
                []
            ]
