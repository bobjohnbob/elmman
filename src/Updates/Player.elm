module Updates.Player exposing (update)

import Types
    exposing
        ( Direction(Up, Down, Left, Right)
        , PlayerModel
        , Msg(Tick, Tock, Press)
        , KeyAction(MoveUp, MoveDown, MoveLeft, MoveRight, NoKeyAction)
        )
import AnimationHelpers exposing (movePosition, distanceFromSpeed, wrapLocation)
import GLOBALS exposing (player_move_speed, play_area_size)


update : Msg -> PlayerModel -> ( PlayerModel, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ( model, Cmd.none )

        Tock timeDiff ->
            if model.moving then
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

                    newLocation =
                        movePosition model.location direction distance
                            |> wrapLocation play_area_size
                in
                    ( { model | location = newLocation }
                    , Cmd.none
                    )
            else
                ( model, Cmd.none )

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
                        ( { model | direction = Up, moving = True }, Cmd.none )

                    MoveDown ->
                        ( { model | direction = Down, moving = True }, Cmd.none )

                    MoveLeft ->
                        ( { model | direction = Left, moving = True }, Cmd.none )

                    MoveRight ->
                        ( { model | direction = Right, moving = True }, Cmd.none )

                    NoKeyAction ->
                        ( model, Cmd.none )
