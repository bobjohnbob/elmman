module Updates.All exposing (update)

import Updates.Player
import Updates.Time
import Types exposing (Msg(Tick, Tock), Model)
import List
import Time exposing (Time)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        tuples =
            { player = Updates.Player.update msg model.player
            , time = Updates.Time.update msg model.time
            }

        returnModel =
            { player = Tuple.first tuples.player
            , time = Tuple.first tuples.time
            }

        commands =
            Cmd.batch
                [ Tuple.second tuples.player
                , Tuple.second tuples.time
                ]
    in
        ( returnModel, commands )
