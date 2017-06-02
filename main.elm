import Html exposing (Html, Attribute, input, button, div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = { count : Int, content : String } 

model : Model
model =
    { count = 0, content = "" }

-- UPDATE

type Msg = Increment | Decrement | Reset | ChangeContent String

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment -> 
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }

        Reset ->
            { model | count = 0 }
        
        ChangeContent newContent ->
            { model | content = newContent }


-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Increment ] [ text "+" ]
        , div [] [ text (toString model.count) ]
        , button [ onClick Decrement ] [ text "-" ]
        , button [ onClick Reset ] [ text "Reset" ]
        , input [ placeholder "Text to reverse", onInput ChangeContent ] []
        , div [] [ text (String.reverse model.content )]
        ]
        
    
