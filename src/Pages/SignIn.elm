module Pages.SignIn exposing (Model, Msg, page)

import Css exposing (..)
import Html.Styled as Html exposing (..)
import Html.Styled.Events as Events
import Effect exposing (Effect)
import Gen.Params.SignIn exposing (Params)
import Page
import Request
import Shared
import View exposing (View)
import Page


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.advanced
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    {}


init : ( Model, Effect Msg )
init =
    ( {}, Effect.none )



-- UPDATE


type Msg = ClickedSignIn


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        ClickedSignIn ->
            ( model
            , Effect.fromShared (Shared.SignIn { name = "Ryan"} )
            )

-- VIEW

view : Model -> View Msg
view model =
    { title = "Sign In"
    , body =
          [ button
              [ Events.onClick ClickedSignIn ]
              [ text "Sign in" ]
          ]
    }

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



