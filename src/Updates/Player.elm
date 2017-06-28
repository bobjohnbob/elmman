module Updates.Player exposing (update)

import Types
    exposing
        ( Direction(Up, Down, Left, Right)
        , PlayerModel
        , Msg(Tick, Tock, Press)
        , KeyAction(MoveUp, MoveDown, MoveLeft, MoveRight, NoKeyAction)
        )
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
                            270

                        Left ->
                            180

                        Down ->
                            90

                distance =
                    distanceFromSpeed player_move_speed timeDiff
            in
                ( { model | location = movePosition model.location direction distance }
                , Cmd.none
                )

        Press keyCode ->
            let
                keyMap =
                    [ ( MoveUp, [ 38 ] )
                    , ( MoveDown, [ 40 ] )
                    , ( MoveLeft, [ 37 ] )
                    , ( MoveRight, [ 39 ] )
                    ]

                direction =
                    List.foldl
                        (\( key, codes ) found ->
                            if List.member keyCode codes then
                                key
                            else
                                found
                        )
                        NoKeyAction
                        keyMap
            in
                case direction of
                    MoveUp ->
                        ( { model | direction = Up }, Cmd.none )

                    MoveDown ->
                        ( { model | direction = Down }, Cmd.none )

                    MoveLeft ->
                        ( { model | direction = Left }, Cmd.none )

                    MoveRight ->
                        ( { model | direction = Right }, Cmd.none )

                    NoKeyAction ->
                        ( model, Cmd.none )
