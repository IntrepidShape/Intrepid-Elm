module Pages.Geometry exposing (view)

import Css exposing (..)
import Html.Styled as Styled
import Html.Styled.Attributes as Styled exposing (css)
import Pages.Home_ exposing (holyGrail)
import Svg.Styled as Svg exposing (..)
import Svg.Styled.Attributes as Svg
import View exposing (View)


view : View msg
view =
    let
        articleContent =
            [ Styled.div
                [ css [ width (px 200), height (px 200), backgroundColor (hex "#E4FCB8") ]
                ]
                [ Svg.svg [ Svg.css [ width (px 200), height (px 200) ], Svg.viewBox "0 0 100 100" ]
                    [ Svg.circle [ Svg.cx "50", Svg.cy "50", Svg.r "40", Svg.stroke "black", Svg.strokeWidth "3", Svg.fill "white" ] []
                    , Svg.text "Circle" 
                    ]
                ]
            ]
    in
    { title = "Intrepid Shape"
    , body = [ holyGrail articleContent ]
    }
