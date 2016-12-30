port module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

type alias Model =
  {}

type Msg
  = NoOp

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      model ! []

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
  Sub.batch []

port portA : Int -> Cmd msg
port portB : Int -> Cmd msg

init : ( Model, Cmd Msg )
init =
  {} ! [ portA 5, portA 4, portB 3, portB 2, portA 1 ]
