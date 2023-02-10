module View exposing (View, map, none, placeholder, toBrowserDocument)

import Browser
import Css exposing (..)
import Html.Styled as Html exposing (Html, fromUnstyled, toUnstyled)
import Html.Styled.Attributes exposing (class)


type alias View msg =
    { title : String
    , body : List (Html msg)
    }


placeholder : String -> View msg
placeholder str =
    { title = str
    , body = [ Html.div [ class "placeholder" ] [ Html.text str ] ]
    }


none : View msg
none =
    placeholder ""


map : (a -> b) -> View a -> View b
map fn view =
    { title = view.title
    , body = List.map (Html.map fn) view.body
    }


-- the above functions should help with the transition from Html to Html.Styled
toBrowserDocument : View msg -> Browser.Document msg
toBrowserDocument view =
    { title = view.title
    , body = [ toUnstyled (Html.div [] view.body) ]
    }