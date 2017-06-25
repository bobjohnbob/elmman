module AnimationHelpers exposing (..)

import Types exposing (Range)


calculateAnimation : Int -> Int -> Range -> Float
calculateAnimation current cycle range =
    let
        ( start, end ) =
            range

        rangeDiff =
            end - start
    in
        (toFloat (current % cycle)) / (toFloat (cycle)) * rangeDiff + start
