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


rectToRectCollision : ( Point, Point ) -> ( Point, Point ) -> Bool
rectToRectCollision ( ( ax1, ay1 ), ( ax2, ay2 ) ) ( ( bx1, by1 ), ( bx2, by2 ) ) =
    ax1 < bx2 && ax2 > bx1 && ay1 < by2 && ay2 > by1
