module Pages.Home_ exposing (holyGrail, view)

import Css exposing (..)
import Css.Transitions exposing (background)
import Gen.Route exposing (Route(..))
import Html.Styled as Styled exposing (Html, iframe)
import Html.Styled.Attributes exposing (css, href, src)
import Page exposing (Page)
import Request exposing (Request)
import View exposing (View)


view : View msg
view =
    let
        articleContent =
            [ iframe
                [ Html.Styled.Attributes.style "border-radius" "12px"
                , Html.Styled.Attributes.src "https://open.spotify.com/embed/track/4JZcJ0MKqH3y3u3gev3svd?utm_source=generator&theme=0"
                , Html.Styled.Attributes.width 800
                , Html.Styled.Attributes.height 152
                , Html.Styled.Attributes.attribute "frameborder" "0"
                , Html.Styled.Attributes.attribute "allowfullscreen" ""
                , Html.Styled.Attributes.attribute "allow" "autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
                , Html.Styled.Attributes.attribute "loading" "lazy"
                , Html.Styled.Attributes.css
                    [ Css.marginBottom (px 20)
                    , Css.marginTop (px 20)
                    , Css.marginLeft Css.auto
                    , Css.marginRight Css.auto
                    , Css.display Css.block
                    ]
                ]
                []
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.audio [ src "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3" ] [] ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.text """I'm baby woke mlkshk wolf bitters live-edge blue bottle, hammock freegan copper mug whatever cold-pressed""" ]
            , Styled.p [] [ Styled.audio [ src "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3" ] [] ]
            , Styled.p [ Html.Styled.Attributes.css [ Css.textDecoration Css.underline ] ] [ Styled.a [ href "https://www.youtube.com/watch?v=QH2-TGUlwu4" ] [ Styled.text "This is a link" ] ]
            ]
    in
    { title = "Intrepid Shape"
    , body = [ holyGrail articleContent [ ( "Home", Gen.Route.Home_ ), ( "OtherPage", Gen.Route.OtherPage ) ] ]
    }



-- The whole article area should alays be at least 100% of the viewport height


holyGrail : List (Styled.Html msg) -> List ( String, Route ) -> Html msg
holyGrail articleContent navBarContent =
    Styled.div
        [ Html.Styled.Attributes.css
            [ Css.position Css.relative
            , Css.top <| Css.pct 0
            , Css.zIndex <| Css.int 1
            , Css.width (pct 100)
            , Css.height (pct 100)
            ]
        ]
        [ holyGrailHeader
        , holyGrailMain_ articleContent navBarContent
        , holyGrailFooter 
        ]
        
holyGrailHeader : Html msg
holyGrailHeader =
    Styled.header
            [ Html.Styled.Attributes.css
                [ Css.position Css.relative
                , Css.displayFlex
                , Css.flexDirection Css.row
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                , backgroundColor intrepidColourPrimary2
                , Css.border3 (px 5) Css.solid intrepidColourPrimary3
                ]
            ]
            [ Styled.h1
                [ Html.Styled.Attributes.css
                    [ Css.fontSize (px 34)
                    , Css.alignItems Css.center
                    , Css.justifyContent Css.center
                    ]
                ]
                [ Styled.text "Welcome to Intrepid Shape" ]
            ]

holyGrailMain_ : List (Styled.Html msg) -> List ( String, Route ) -> Html msg
holyGrailMain_ articleContent navBarContent =
    Styled.main_
            [ Html.Styled.Attributes.css
                [ Css.position Css.relative
                , Css.displayFlex
                , Css.flexDirection Css.row
                , Css.backgroundColor intrepidColourSecondary2_0
                , Css.justifyContent Css.center
                ]
            ]
            [ Styled.div
                [ Html.Styled.Attributes.css
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
                    ]
                ]
                [ Styled.nav
                    [ Html.Styled.Attributes.css
                        [ Css.flexWrap Css.wrap
                        , Css.position Css.sticky
                        , Css.top <| Css.pct 0
                        , Css.zIndex <| Css.int 1
                        ]
                    ]
                    [ mapNavBarContent navBarContent ]
                ]
            , mapArticleContent articleContent
            , Styled.aside
                [ Html.Styled.Attributes.css
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
                [ Styled.p [] [ Styled.text "Asid from all that, there is some text over here too!" ] ]
            ]
            
mapNavBarContent : List ( String, Route ) -> Html msg
mapNavBarContent content =
    let
        contentList =
            List.map (\x -> x) content
    in
    Styled.div
        [ Html.Styled.Attributes.css
            [ Css.position Css.sticky
            , Css.top <| Css.px 0
            , Css.zIndex <| Css.int 1
            , Css.displayFlex
            , Css.flexDirection Css.column
            , Css.alignItems Css.center
            , Css.justifyContent Css.center
            ]
        ]
        (List.map (\( label, route ) -> viewLink label route) contentList)


viewLink : String -> Route -> Html msg
viewLink label route =
    Styled.a
        [ Html.Styled.Attributes.href (Gen.Route.toHref route)
        ]
        [ Styled.p [] [ Styled.text label ] ]



-- The whole article area should alays be at least 100% of the viewport height


mapArticleContent : List (Html msg) -> Html msg
mapArticleContent articleContent =
    Styled.article
        [ Html.Styled.Attributes.css
            [ Css.width <| Css.pct 80
            , Css.displayFlex
            , Css.flexWrap Css.wrap
            , fontSize (px 20)
            , Css.backgroundColor intrepidColourPrimary1
            , Css.padding <| Css.px 20
            ]
        ]
        articleContent

holyGrailFooter : Html msg
holyGrailFooter =
    Styled.footer
            [ Html.Styled.Attributes.css
                [ Css.displayFlex
                , Css.flexWrap Css.wrap
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                , Css.fontSize <| Css.px 10
                , backgroundColor intrepidColourSecondary2_1
                , border3 (px 5) Css.solid intrepidColourSecondary2_2
                ]
            ]
            [ Styled.p [] [ Styled.text "© 2023 Intrepid Shape" ] ]


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
