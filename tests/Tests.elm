module Tests exposing (..)

import Test exposing (..)
import Expect
import AnimationHelpers exposing (calculateAnimation, movePosition, distanceFromSpeed, fmod)


trimFloatX : Int -> Float -> Float
trimFloatX precision num =
    ((num * toFloat (10 ^ precision)) |> round |> toFloat) / toFloat (10 ^ precision)


trimTupleX : Int -> ( Float, Float ) -> ( Float, Float )
trimTupleX precision ( first, second ) =
    ( trimFloatX precision first, trimFloatX precision second )


trimFloat1 =
    trimFloatX 1


trimTuple1 =
    trimTupleX 1


all : Test
all =
    describe "Elmman Test Suite"
        [ describe "Animations frame mapping function"
            [ test "Animation frame calculations" <|
                \() ->
                    Expect.equal (calculateAnimation 100 500 ( 0, 200 )) 40
            , test "Animation frame calculations 2" <|
                \() ->
                    Expect.equal (calculateAnimation 500 500 ( 0, 200 )) 200
            , test "Animation frame calculations 3" <|
                \() ->
                    Expect.equal (calculateAnimation 501 500 ( 0, 200 )) 0
            , test "Animation frame calculations with increased range" <|
                \() ->
                    Expect.equal (calculateAnimation 500 500 ( 100, 300 )) 300
            , test "Animation frame calculations with increased range 2" <|
                \() ->
                    Expect.equal (calculateAnimation 100 500 ( 100, 300 )) 140
            , test "Animation frame calculations with negative range" <|
                \() ->
                    Expect.equal (calculateAnimation 100 500 ( -100, 100 )) -60
            ]
        , describe "Position movement function"
            [ test "Move 45 degrees 10 units" <|
                \() ->
                    Expect.equal
                        (trimTuple1 (movePosition ( 0, 0 ) 45 10))
                        ( 7.1, 7.1 )
            , test "Move 45 degrees 200 units from 10,10" <|
                \() ->
                    Expect.equal
                        (trimTuple1 (movePosition ( 10, 10 ) 45 200))
                        ( 151.4, 151.4 )
            , test "Move 158 degrees 200 units" <|
                \() ->
                    Expect.equal
                        (trimTuple1 (movePosition ( 0, 0 ) 158 200))
                        ( -185.4, 74.9 )
            , test "Move 360 degrees 200 units" <|
                \() ->
                    Expect.equal
                        (trimTuple1 (movePosition ( 0, 0 ) 360 200))
                        ( 200, 0 )
            , test "Move 312 degrees 150 units" <|
                \() ->
                    Expect.equal
                        (trimTuple1 (movePosition ( 0, 0 ) 312 150))
                        ( 100.4, -111.5 )
            ]
        , describe "convert speed/time to distance function"
            [ test "speed 200u/s for 4ms" <|
                \() ->
                    Expect.equal
                        (trimFloat1 (distanceFromSpeed 200 4))
                        0.8
            , test "speed 2000u/s for 1ms" <|
                \() ->
                    Expect.equal
                        (distanceFromSpeed 2000 1)
                        2
            , test "speed 1 u/s for 1ms" <|
                \() ->
                    Expect.equal
                        (distanceFromSpeed 1 1)
                        0.001
            , test "speed 1 u/s for 1000ms" <|
                \() ->
                    Expect.equal
                        (distanceFromSpeed 1 1000)
                        1
            ]
        , describe "modulus for float"
            [ test "10.15 % 9" <|
                \() ->
                    Expect.equal
                        (trimFloatX 2 (fmod 10.15 9))
                        1.15
            , test "51934 % 123" <|
                \() ->
                    Expect.equal
                        (fmod 51934 123)
                        28
            ]
        ]
