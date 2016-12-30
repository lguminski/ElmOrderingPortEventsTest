port module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Process
import Task

type alias Model =
  {}

type Msg
  = NoOp
  | Test ()


main =
  Html.program
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }

view : Model -> Html Msg
view model =
  div [] []

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch [ triggerTest Test ]

port portA : Int -> Cmd msg
port portB : Int -> Cmd msg
port triggerTest : (() -> msg) -> Sub msg

init : ( Model, Cmd Msg )
init =
  {} ! []

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of

    NoOp ->
      model ! []

    Test _ ->
      model ! [ portA 5, portA 4, portB 3, portB 2, portA 1 ]
