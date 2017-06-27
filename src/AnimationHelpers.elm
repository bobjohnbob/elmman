module AnimationHelpers exposing (..)

import Types exposing (Range)
import Svg.Path exposing (Point)


calculateAnimation : Int -> Int -> Range -> Float
calculateAnimation current cycle range =
    let
        ( start, end ) =
            range

        rangeDiff =
            end - start
    in
        (toFloat (current % (cycle + 1))) / (toFloat (cycle)) * rangeDiff + start


movePosition : Point -> Float -> Float -> Point
movePosition position direction distance =
    let
        rads =
            degrees direction

        x =
            (Tuple.first position) + (cos rads * distance)

        y =
            (Tuple.second position) + (sin rads * distance)
    in
        ( x, y )


distanceFromSpeed : Float -> Float -> Float
distanceFromSpeed pixPerSec millis =
    pixPerSec * millis / 1000


fmod : Float -> Float -> Float
fmod lh rh =
    lh - (toFloat (floor (lh / rh)) * rh)
