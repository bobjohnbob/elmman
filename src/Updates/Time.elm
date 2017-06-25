module Updates.Time exposing (update)

import Time exposing (Time)
import Types exposing (Msg(Tick, Tock))


update : Msg -> Time -> ( Time, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ( newTime, Cmd.none )

        Tock timeDiff ->
            ( model, Cmd.none )
