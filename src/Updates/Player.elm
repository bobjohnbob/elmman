module Updates.Player exposing (update)

import Types exposing (PlayerModel, Msg)


update : Msg -> PlayerModel -> ( PlayerModel, Cmd Msg )
update msg model =
    ( model, Cmd.none )
