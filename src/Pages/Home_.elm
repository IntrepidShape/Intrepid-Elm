module Pages.Home_ exposing (holyGrail, view)

import Css exposing (..)
import Gen.Route exposing (Route(..))
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Html exposing (css, href)
import Html.Styled.Events as Html
import View exposing (View)

view : View msg
view =
    let
        articleContent =
            [ Html.p [] [ Html.text "Life is a journey, not a destination. Embrace the journey of self-discovery and find success through learning and self-improvement." ]
            , Html.p [] [ Html.text "Mathematics is the language of the universe. Learn to speak it fluently and unlock the potential of your mind." ]
            , Html.p [] [ Html.text "Eudaimonia is the path to a virtuous and fulfilled life. Harness the power of Stoicism to become the best version of yourself." ]
            , Html.p [] [ Html.text "Programming is the key to unlocking new possibilities. Invest in yourself and become a master of the digital age." ]
            , Html.p [] [ Html.text "Success is a journey, not a destination. Find your true purpose and use it to reach your highest potential." ]
            , Html.p [] [ Html.text "Self-discipline is the foundation of success. Develop the habits that will lead you to a better life." ]
            , Html.p [] [ Html.text "The mind is a powerful tool. Learn to use it to your advantage and unlock your true potential." ]
            ]
    in
    { title = "Intrepid Shape"  -- The title of the page
    , body =
        [ holyGrail articleContent
        ]
    }

holyGrail : List (Html msg) -> Html msg
holyGrail articleContent =
    Html.div
        [ css
            [ Css.position Css.relative
            , Css.top <| Css.pct 0
            , Css.zIndex <| Css.int 1
            , Css.width (pct 100)
            , Css.height (pct 100)
            ]
        ]
        [ holyGrailHeader
        , holyGrailMain_ articleContent
        , holyGrailFooter
        ]


holyGrailHeader : Html msg
holyGrailHeader =
    Html.header
        -- display a webp image as the background image
        [ css
            [ Css.position Css.relative
            , Css.top <| Css.pct 0
            , Css.zIndex <| Css.int 1
            , Css.width (pct 100)
            , Css.height (px 100)
            , Css.border3 (px 5) Css.solid intrepidColourPrimary3
            , Css.backgroundColor intrepidColourPrimary1
            , Css.backgroundRepeat Css.repeat
            , Css.backgroundSize Css.cover
            , Css.backgroundPosition Css.center -- the background image is not displaying??
            , Css.backgroundBlendMode Css.multiply
            ]
        ]
        [ Html.div
            [ css
                [ Css.position Css.relative
                , Css.top <| Css.pct 0
                , Css.zIndex <| Css.int 1
                , Css.width (pct 100)
                , Css.height (px 100)
                , Css.displayFlex
                , Css.flexDirection Css.row
                , Css.justifyContent Css.center
                , Css.alignItems Css.center
                , Css.backgroundColor intrepidColourPrimary2
                ]
            ]
            [ Html.h1
                [ css
                    [ Css.fontFamily fantasy
                    , Css.fontSize (px 50)
                    , Css.fontWeight Css.bold
                    , Css.textAlign Css.center
                    ]
                ]
                [ Html.text "Intrepid Shape" ]
            ]
        ]



-- Simple title in the header that is all


holyGrailMain_ : List (Html.Html msg)-> Html msg
holyGrailMain_ articleContent =
    Html.main_
        [ css
            [ Css.position Css.relative
            , Css.displayFlex
            , Css.flexDirection Css.row
            , Css.justifyContent Css.center
            , Css.backgroundColor intrepidColourPrimary1
            , Css.backgroundRepeat Css.repeat
            ]
        ]
        [ Html.div
            [ css
                [ Css.position Css.relative
                , Css.top <| Css.pct 0
                , Css.zIndex <| Css.int 1
                , Css.width <| Css.pct 7
                , Css.paddingLeft <| Css.pct 3
                , Css.textAlign Css.marginLeft
                , Css.displayFlex
                , Css.flexWrap Css.wrap
                , Css.backgroundColor intrepidColourPrimary2
                , Css.border3 (px 5) Css.solid intrepidColourPrimary3
                , Css.borderTop (px 0)
                , Css.backgroundRepeat Css.repeat
                ]
            ]
            [ Html.nav
                [ css
                    [ Css.flexWrap Css.wrap
                    , Css.position Css.sticky
                    , Css.top <| Css.pct 0
                    , Css.zIndex <| Css.int 1
                    , Css.displayFlex
                    , Css.flexDirection Css.column
                    , Css.alignItems Css.center
                    ]
                ]
                [ mapNavBarContent [ ( "Home", Gen.Route.Home_ ), ( "Morning", Gen.Route.Morning ), ( "Geometry", Gen.Route.Geometry ), ( "Calendar", Gen.Route.Calendar ) ]
                ]
            ]
        , mapArticleContent articleContent
        , Html.aside
            [ css
                [ Css.flexWrap Css.wrap
                , Css.position Css.sticky
                , Css.top <| Css.px 0
                , Css.zIndex <| Css.int 1
                , Css.displayFlex
                , Css.flexDirection Css.column
                , Css.alignItems Css.center
                , Css.width <| Css.pct 7
                , Css.paddingLeft <| Css.pct 1.5
                , Css.paddingRight <| Css.pct 1.5
                , Css.backgroundColor intrepidColourPrimary2
                , Css.border3 (px 5) Css.solid intrepidColourPrimary3
                , Css.borderTop (px 0)
                ]
            ]
            [ Html.div
                [ css
                    [ Css.flexWrap Css.wrap
                    , Css.position Css.sticky
                    , Css.top <| Css.pct 0
                    , Css.zIndex <| Css.int 1
                    , Css.fontSize (px 12)
                    ]
                ]
                [ Html.p [] [ Html.text "Life is a journey, not a destination. Embrace the journey of self-discovery and find success through learning and self-improvement." ]
                , Html.p [] [ Html.text "Mathematics is the language of the universe. Learn to speak it fluently and unlock the potential of your mind." ]
                , Html.p [] [ Html.text "Eudaimonia is the path to a virtuous and fulfilled life. Harness the power of Stoicism to become the best version of yourself." ]
                , Html.p [] [ Html.text "Programming is the key to unlocking new possibilities. Invest in yourself and become a master of the digital age." ]
                , Html.p [] [ Html.text "Success is a journey, not a destination. Find your true purpose and use it to reach your highest potential." ]
                , Html.p [] [ Html.text "Self-discipline is the foundation of success. Develop the habits that will lead you to a better life." ]
                , Html.p [] [ Html.text "The mind is a powerful tool. Learn to use it to your advantage and unlock your true potential." ]
                ]
            ]
        ]


mapNavBarContent : List ( String, Route ) -> Html msg
mapNavBarContent content =
    let
        contentList =
            List.map (\x -> x) content
    in
    Html.ul
        [ css
            [ Css.position Css.sticky
            , Css.top <| Css.px 0
            , Css.zIndex <| Css.int 1
            , Css.displayFlex
            , Css.flexDirection Css.column
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            , Css.listStyleType Css.none
            , Css.padding <| Css.pct 0
            , Css.paddingTop <| Css.px 10
            , Css.marginLeft <| Css.pct -40
            ]
        ]
        (List.map (\( label, route ) -> viewLink label route) contentList)
        


viewLink : String -> Route -> Html msg
viewLink label route =
    Html.a
        [ css
            [ Css.backgroundColor intrepidColourPrimary0
            , Css.border (px 0)
            , Css.borderRadius <| Css.px 4
            , Css.padding <| Css.px 10
            , Css.textDecoration Css.none
            , Css.fontSize <| Css.pct 100
            , Css.width <| Css.pct 80
            , Css.height <| Css.pct 10
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            , Css.marginBottom <| Css.px 10 
            , Css.textAlign Css.center 
            , border3 (px 5) Css.solid intrepidColourPrimary3
            , Css.hover [ Css.backgroundColor intrepidColourPrimary3 ]
            , Css.fontFamily Css.fantasy 
            ]
        , href (Gen.Route.toHref route)
        ]
        [ Html.text label ]



-- The whole article area should alays be at least 100% of the viewport height


mapArticleContent : List (Html msg) -> Html msg
mapArticleContent articleContent =
    Html.article
        [ css
            [ Css.width <| Css.pct 80
            , Css.displayFlex
            , Css.flexWrap Css.wrap
            , fontSize (px 20)
            , Css.padding <| Css.px 20
            , Css.justifyContent Css.center
            , Css.backgroundImage (url "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fstock-illustration-black-outline-flower-life-sacred-geometry-pattern-vector-contour-monochrome-hinduism-seamless-blue-background-image66344893&psig=AOvVaw0t-6hRSRi95Yinhy0uuI2e&ust=1676214680537000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCLiY37bgjf0CFQAAAAAdAAAAABAK")
            , Css.backgroundRepeat Css.repeat
            , Css.backgroundSize Css.contain
            , Css.backgroundPosition Css.center
            ]
        ]
        articleContent


holyGrailFooter : Html msg
holyGrailFooter =
    Html.footer
        [ css
            [ Css.displayFlex
            , Css.flexWrap Css.wrap
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            , Css.fontSize <| Css.px 10
            , backgroundColor intrepidColourSecondary2_1
            , border3 (px 5) Css.solid intrepidColourSecondary2_2
            ]
        ]
        [ Html.p [] [ Html.text "© 2023 Intrepid Shape" ] ]


intrepidColourPrimary0 : Color
intrepidColourPrimary0 =
    hex "#C2F366"


intrepidColourPrimary1 : Color
intrepidColourPrimary1 =
    hex "#E4FCB8"


intrepidColourPrimary2 : Color
intrepidColourPrimary2 =
    hex "#D2F88B"


intrepidColourPrimary3 : Color
intrepidColourPrimary3 =
    hex "#B4EE47"


intrepidColourPrimary4 : Color
intrepidColourPrimary4 =
    hex "#9AD922"


intrepidColourSecondary1_0 : Color
intrepidColourSecondary1_0 =
    hex "#FF6E6B"


intrepidColourSecondary1_1 : Color
intrepidColourSecondary1_1 =
    hex "#FFBCBA"


intrepidColourSecondary1_2 : Color
intrepidColourSecondary1_2 =
    hex "#FF918F"


intrepidColourSecondary1_3 : Color
intrepidColourSecondary1_3 =
    hex "#FF514C"


intrepidColourSecondary1_4 : Color
intrepidColourSecondary1_4 =
    hex "#E92A25"


intrepidColourSecondary2_0 : Color
intrepidColourSecondary2_0 =
    hex "#A158C6"


intrepidColourSecondary2_1 : Color
intrepidColourSecondary2_1 =
    hex "#DBB2F0"


intrepidColourSecondary2_2 : Color
intrepidColourSecondary2_2 =
    hex "#BD80DC"


intrepidColourSecondary2_3 : Color
intrepidColourSecondary2_3 =
    hex "#863AAC"


intrepidColourSecondary2_4 : Color
intrepidColourSecondary2_4 =
    hex "#711F9B"


