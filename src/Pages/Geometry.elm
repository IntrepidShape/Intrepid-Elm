module Pages.Geometry exposing (view)

import Css exposing (..)
import Gen.Route exposing (Route)
import Html.Styled as Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Pages.Home_ exposing (holyGrail)
import Svg.Styled as Svg exposing (circle, path, svg, text)
import Svg.Styled.Attributes as Svg exposing (cx, cy, d, fill, r, stroke, strokeWidth, x1, x2, y1, y2)
import View exposing (View)


view : View msg
view =
    let
        articleContent =
            [ div
                [ css [ width (px 100), height (px 100), backgroundColor (hex "FF0000") ]
                ]
                [ Svg.svg [ Svg.css [ width (px 100), height (px 100) ], Svg.viewBox "0 0 100 100" ]
                    [ Svg.circle [ Svg.cx "50", Svg.cy "50", Svg.r "40", Svg.stroke "black", Svg.strokeWidth "3", Svg.fill "red" ] []
                    , Svg.text "Circle" 
                    ]
                ]
            ]
    in
    { title = "Intrepid Shape"
    , body = [ holyGrail articleContent [ ( "Home", Gen.Route.Home_ ), ( "OtherPage", Gen.Route.OtherPage ), ( "Geometry", Gen.Route.Geometry ) ] ]
    }
