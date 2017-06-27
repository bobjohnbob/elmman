module Updates.Player exposing (update)

import Types exposing (Direction(Up, Down, Left, Right), PlayerModel, Msg(Tick, Tock))
import AnimationHelpers exposing (movePosition, distanceFromSpeed)
import GLOBALS exposing (player_move_speed)


update : Msg -> PlayerModel -> ( PlayerModel, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ( model, Cmd.none )

        Tock timeDiff ->
            let
                direction =
                    case model.direction of
                        Right ->
                            0

                        Up ->
                            90

                        Left ->
                            180

                        Down ->
                            270

                distance =
                    distanceFromSpeed player_move_speed timeDiff
            in
                ( { model | location = movePosition model.location direction distance }
                , Cmd.none
                )
