import Html exposing (Html, h1, div, text)
import Time exposing (Time, second)
import Svg exposing (Svg, svg, g, path)
import Svg.Attributes exposing (stroke, fill, strokeLinejoin, strokeWidth, width, height, viewBox, d)
import Svg.Path exposing (pathToString, arcBy, subpath, closed, lineBy, startAt, antiClockwise, clockwise, largestArc)


mOVE_SPEED = 60 -- pixels per second
cHAR_RAD = 25 --half-width of character
wIDTH = "500"
hEIGHT = "900"

main : Program Never Model Msg
main =
  Html.beginnerProgram 
    { model = model
    , view = view
    , update = update
    }


-- MODEL

type alias Model = 
    { time : Time}

model : Model
model = {
    time = 0
    }

-- UPDATE

type Msg = Tick Time

update : Msg -> Model -> Model
update msg model =
    case msg of
        Tick newTime ->
            { model | time = newTime }

-- SUMSCRIPTIONS

-- VIEW

type alias Point = (Float, Float)

render : String -> String -> Model -> Html msg
render w h model = 
    svg [ width w, height h, viewBox "0 0 500, 900"] [pacman (250, 450) (degrees 90)]

pacman : Point -> Float -> Svg msg
pacman position openness =
    let
        opp = cHAR_RAD * sin (openness/2)
        adj = cHAR_RAD * cos (openness/2)
    in
        g []
            [ path 
                [ d <|
                    pathToString [(subpath (startAt position) closed 
                        [lineBy (adj, opp)
                        ,arcBy (cHAR_RAD, cHAR_RAD) 0 (largestArc, clockwise) (0, -(opp * 2))
                        ,lineBy (-adj, opp)
                        ]
                    )]
                ,fill "#ffff00"
                ] 
                []
            ]
        
                    
view : Model -> Html Msg
view model =
    div []
        [h1 [] [text "ElmMan!"]
        ,render wIDTH hEIGHT model
        ]

        
    
