module View exposing (View, map, none, placeholder, toBrowserDocument)

import Html.Styled
import Browser
import Html.Styled as Html exposing (Html, toUnstyled)

type alias View msg =
    { title : String
    , body : List (Html msg)
    }


placeholder : String -> View msg
placeholder str =
    { title = str
    , body = [ Html.Styled.text str ]
    }


none : View msg
none =
    placeholder ""


map : (a -> b) -> View a -> View b
map fn view =
    { title = view.title
    , body = List.map (Html.Styled.map fn) view.body
    }


toBrowserDocument : View msg -> Browser.Document msg
toBrowserDocument view =
    { title = view.title
    , body = [ toUnstyled (Html.Styled.div [] view.body) ]
    }
