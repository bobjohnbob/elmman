module Tests exposing (..)

import Test exposing (..)
import Expect
import AnimationHelpers exposing (calculateAnimation)


all : Test
all =
    describe "Elmman Test Suite"
        [ describe "Player logic tests"
            [ test "Animation frame calculations" <|
                \() ->
                    Expect.equal (calculateAnimation 100 500 ( 0, 200 )) 40
            , test "Animation frame calculations 2" <|
                \() ->
                    Expect.equal (calculateAnimation 500 500 ( 0, 200 )) 200
            , test "Animation frame calculations 3" <|
                \() ->
                    Expect.equal (calculateAnimation 501 500 ( 0, 200 )) 0
            , test "Animation frame calculations 4" <|
                \() ->
                    Expect.equal (calculateAnimation 500 500 ( 100, 300 )) 300
            , test "Animation frame calculations 5" <|
                \() ->
                    Expect.equal (calculateAnimation 100 500 ( 100, 300 )) 140
            , test "Animation frame calculations 6" <|
                \() ->
                    Expect.equal (calculateAnimation 100 500 ( -100, 100 )) -60
            ]
        ]
