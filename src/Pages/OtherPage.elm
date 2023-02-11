module Pages.OtherPage exposing (view)

import Css exposing (..)
import Gen.Route exposing (Route)
import Html.Styled as Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Pages.Home_ exposing (holyGrail)
import View exposing (View)


view : View msg
view =
    let
        articleContent =
            [ div
                [ css
                    [ alignItems center
                    , justifyContent center
                    , backgroundColor (hex "f0f0f0")
                    ]
                ]
                [ h1
                    [ css
                        [ color (hex "000000")
                        , fontSize (px 40)
                        , fontWeight bold
                        ]
                    ]
                    [ text "Other Page" ]
                , p
                    [ css
                        [ color (hex "000000")
                        , fontSize (px 20)
                        , fontWeight normal
                        ]
                    ]
                    [ text "This is the other page" ]
                ]   
            ]
    in
    { title = "Intrepid Shape"
    , body = [ holyGrail articleContent [ ( "Home", Gen.Route.Home_ ), ( "OtherPage", Gen.Route.OtherPage ) , ( "Geometry" , Gen.Route.Geometry ) ] ]
    }
