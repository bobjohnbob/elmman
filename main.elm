import Html exposing (Html, h1, div, text)
import Time exposing (Time, inMilliseconds)
import Svg exposing (Svg, svg, g, path)
import Svg.Attributes exposing (stroke, fill, strokeLinejoin, strokeWidth, width, height, viewBox, d)
import Svg.Path exposing (pathToString, arcBy, subpath, closed, lineBy, startAt, antiClockwise, clockwise, largestArc)
import AnimationFrame exposing (times)


mOVE_SPEED = 60 -- pixels per second
cHAR_RAD = 25 --half-width of character
wIDTH = "500"
hEIGHT = "900"

main : Program Never Model Msg
main =
  Html.program 
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

type alias Model = 
    { time : Time }

init : (Model, Cmd msg)
init = 
    ({ time = 0 }
    ,Cmd.none
    )

-- UPDATE

type Msg = Tick Time

update : Msg -> Model -> (Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ({ model | time = newTime }, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = 
    times Tick

-- VIEW

type alias Point = (Float, Float)

render : String -> String -> Model -> Html msg
render w h model = 
    let
        -- Pull this out into a function to calculate a position in a range
        --  based off of a cycle time and current number in the cycle.
        cycleTime = 500
        maxOpen = 90
        currentCycleRatio = (model.time |> inMilliseconds |> round) % cycleTime
        openness = (toFloat currentCycleRatio) / (cycleTime / (2 * maxOpen)) - maxOpen |> abs
    in
        svg 
            [ width w, height h, viewBox "0 0 500, 900"] 
            [pacman (250, 450) (degrees openness)]

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

        
    
