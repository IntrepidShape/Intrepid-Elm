module Pages.Calendar exposing (page, Model, Msg(..))

import Browser
import Css exposing (..)
import Date exposing (Date, Interval(..), Unit(..))
import Html.Attributes
import Html.Styled as Html exposing (Html, form)
import Html.Styled.Attributes as Html exposing (css)
import Page
import Pages.Home_ exposing (holyGrail)
import Request exposing (Request)
import Shared
import Task exposing (Task)
import Time exposing (Month(..))
import View exposing (View)


page : Shared.Model -> Request -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    Date


type Msg
    = ReceiveDate Date


init : ( Model, Cmd Msg )
init =
    ( Date.fromCalendarDate 2019 Jan 1
    , Date.today |> Task.perform ReceiveDate
    )



-- update


update : Msg -> Model -> ( Model, Cmd Msg )
update (ReceiveDate today) _ =
    ( today
    , Cmd.none
    )




-- view

-- Change this view that into a funtion that just returns the formated date, it shouldn't be a view anymore. Called dateNow.
view : Model -> View Msg
view date =
    let
        articleContent =
            [ Html.text (date |> Date.format "EEEE, d MMMM y") ]
    in
    { title = "Intrepid Shape"
    , body = [ holyGrail articleContent ]
    }


dateNow : Model -> Html Msg
dateNow date =
    Html.text (date |> Date.format "EEEE, d MMMM y")
