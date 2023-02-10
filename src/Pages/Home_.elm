module Pages.Home_ exposing (view, holyGrail)

import Css exposing (..)
import Gen.Route exposing (Route(..))
import Html.Styled as Styled exposing (Html)
import Html.Styled.Attributes
import Page exposing (Page)
import Request exposing (Request)
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
    , body = [ holyGrail articleContent [ ("Home", Gen.Route.Home_ ), ("OtherPage", Gen.Route.OtherPage)] ]
    }

holyGrail : List String -> List ( String, Route ) -> Html msg

holyGrail articleContent navBarContent =
    Styled.div
        [ Html.Styled.Attributes.css
            [ Css.position Css.relative
            , Css.height <| Css.pct 100
            ]
        ]
        [ Styled.header
            [ Html.Styled.Attributes.css
                [ Css.position Css.relative
                , Css.displayFlex
                , Css.flexDirection Css.row
                , Css.alignItems Css.center
                , Css.justifyContent Css.center
                ]
            ]
            [ Styled.h1 [] [ Styled.text "Welcome to Intrepid Shape" ] ]

        -- this should be centre aligned
        , Styled.main_
            [ Html.Styled.Attributes.css
                [ Css.position Css.relative
                , Css.displayFlex
                , Css.flexDirection Css.row
                ]
            ]
            [ Styled.div
                [ Html.Styled.Attributes.css
                    [ Css.position Css.sticky
                    , Css.top <| Css.pct 0
                    , Css.zIndex <| Css.int 1
                    , Css.width <| Css.pct 7
                    , Css.paddingLeft <| Css.pct 3
                    , Css.textAlign Css.marginLeft
                    , Css.displayFlex
                    , Css.flexWrap Css.wrap
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
            , Styled.article
                [ Html.Styled.Attributes.css
                    [ Css.width <| Css.pct 80 
                    , Css.flexWrap Css.wrap
                    , fontSize (px 20)
                    ]
                ]
                [ mapContent articleContent ]
            , Styled.aside
                [ Html.Styled.Attributes.css
                    [ Css.width <| Css.pct 7
                    , Css.paddingLeft <| Css.pct 3
                    , Css.flexWrap Css.wrap
                    ]

                ]
                [ Styled.p [] [ Styled.text "Asid from all that, there is some text over here too!" ] ]
            ]
        , Styled.footer
            [ Html.Styled.Attributes.css
                [ Css.displayFlex
                , Css.flexWrap Css.wrap
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
