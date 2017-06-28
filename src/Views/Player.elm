module Views.Player exposing (..)

import Time exposing (Time, inMilliseconds)
import Svg exposing (Svg, g, path)
import Svg.Attributes
    exposing
        ( fill
        , d
        , transform
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
import Types exposing (Model, Direction(Up, Down, Left, Right))
import GLOBALS exposing (character_radius)


render : Model -> Svg msg
render model =
    let
        x =
            Tuple.first model.player.location

        y =
            Tuple.second model.player.location

        cycleTime =
            500

        maxOpen =
            90

        rotate =
            case model.player.direction of
                Up ->
                    270

                Down ->
                    90

                Left ->
                    180

                Right ->
                    0

        frameCount =
            calculateAnimation (model.time |> inMilliseconds |> round) cycleTime ( 0, maxOpen * 2 )

        openness =
            if frameCount > maxOpen then
                maxOpen - toFloat (round (frameCount) % maxOpen)
            else
                frameCount
    in
        pacman ( x, y ) (degrees openness) rotate


pacman : Point -> Float -> Float -> Svg msg
pacman position openness rotate =
    let
        opp =
            character_radius * sin (openness / 2)

        adj =
            character_radius * cos (openness / 2)

        radiuses =
            ( character_radius, character_radius )

        ( centerX, centerY ) =
            position

        transformValue =
            "rotate(" ++ (toString rotate) ++ " " ++ (toString centerX) ++ " " ++ (toString centerY) ++ ")"
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
                , transform transformValue
                ]
                []
            ]
