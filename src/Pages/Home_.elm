module Pages.Home_ exposing (view)

import Css exposing (..)
import Gen.Route exposing (Route(..))
import Html.Styled as Styled exposing (Html, a, article, aside, div, footer, h1, header, main_, nav, p, text)
import Html.Styled.Attributes exposing (attribute, class, css, href)
import Page exposing (Page)
import Request exposing (Request)
import Shared
import View exposing (View)


view : View msg
view =
    let
        articleContent =
            [ """Are you looking to learn and grow as a software developer? Intrepid Shape is the perfect place to start. Our platform provides an interactive learning environment with an intuitive user interface, comprehensive tutorials, and more. Through our tutorials, developers can learn the fundamentals of Elm and create their own applications."""
            , """On our landing page, you'll find all the latest information about the Intrepid Shape platform. We offer an overview of the Elm tutorials that will soon be available, with detailed descriptions of the topics covered and the learning objectives. Additionally, you can learn about the other resources available on the Intrepid Shape platform, such as support and community forums, resources for product and release updates, and more."""
            , """If you're ready to get started, you can register for a free account. Once you've registered, you'll be able to access the full Intrepid Shape platform, including the Elm tutorials. You'll also be able to access the other resources available on the platform, such as support and community forums, resources for product and release updates, and more."""
            , """Why Elm?"""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            , """Elm is a functional programming language that compiles to JavaScript. It is a statically typed language that is designed to be easy to learn and use."""
            ]
    in
    { title = "Intrepid Shape"
    , body = [ holyGrail articleContent [ ("Home", Gen.Route.Home_ )] ]
    }

holyGrail : List String -> List (String, Route) -> Html msg
holyGrail articleContent navBarContent =
    Styled.div
        [ Html.Styled.Attributes.css
            [ Css.displayFlex
            , Css.flexDirection Css.column
            , Css.height <| Css.pct 100
            ]
        ]
        [ Styled.header
            [ Html.Styled.Attributes.css
                [ Css.displayFlex
                , Css.flexDirection Css.row
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                ]
            ]
            [ Styled.h1 [] [ Styled.text "Welcome to Intrepid Shape" ] ]

        -- this should be centre aligned
        , Styled.main_
            [ Html.Styled.Attributes.css
                [ Css.flexGrow <| Css.int 1
                , Css.displayFlex
                , Css.flexDirection Css.row
                ]
            ]
            [ Styled.div
                [ Html.Styled.Attributes.css
                    [ Css.width <| Css.pct 20 
                    , Css.displayFlex
                    , Css.flexDirection Css.column
                    , Css.alignItems Css.center
                    ]
                ]
                [ Styled.nav
                    [ Html.Styled.Attributes.css
                        [ Css.displayFlex
                        , Css.flexDirection Css.column
                        , Css.alignItems Css.center
                        ]
                    ]
                    [ mapNavBarContent navBarContent ]
                ]
            , Styled.article
                [ Html.Styled.Attributes.css
                    [ Css.flexGrow <| Css.int 1
                    , Css.displayFlex
                    , Css.flexDirection Css.column
                    , fontSize (px 20)
                    ]
                ]
                [ mapContent articleContent ]
            , Styled.aside
                [ Html.Styled.Attributes.css
                    [ Css.width <| Css.pct 20 
                    , Css.displayFlex
                    , Css.flexDirection Css.column
                    , Css.alignItems Css.center
                    ]

                ]
                [ Styled.p [] [ Styled.text "Asid from all that, there is some text over here too!" ] ]
            ]
        , Styled.footer
            -- Small text, centered, on the botto mof the page
            [ Html.Styled.Attributes.css
                [ Css.displayFlex
                , Css.flexDirection Css.column
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                , Css.fontSize <| Css.px 10
                ]
            ]
            [ Styled.p [] [ Styled.text "© 2023 Intrepid Shape" ] ]
        ]
mapContent : List String -> Html msg
mapContent content =
    let
        contentList =
            List.map (\x -> x) content
    in
    Styled.div
        []
        (List.map (\x -> Styled.p [] [ Styled.text x ]) contentList)

-- Make sure it is formated and uses routes correctly instead of strings
mapNavBarContent : List ( String, Route ) -> Html msg
mapNavBarContent content =
    let
        contentList =
            List.map (\x -> x) content
    in
    Styled.div
        []
        (List.map (\( label, route ) -> viewLink label route) contentList)


viewLink : String -> Route -> Html msg
viewLink label route =
    Styled.a
        [ Html.Styled.Attributes.css
            [ Css.displayFlex
            , Css.flexDirection Css.column
            , Css.alignItems Css.center
            ]
        , Html.Styled.Attributes.href (Gen.Route.toHref route)
        ]
        [ Styled.p [] [ Styled.text label ] ]
