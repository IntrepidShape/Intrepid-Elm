module Pages.OtherPage exposing (view)

import View exposing (View)
import Pages.Home_ exposing (holyGrail)
import Gen.Route exposing (Route)

view : View msg
view =
    let
        articleContent =
            [ """This is another Page.  It is a bit more interesting than the Home Page.  It has a list of things to do:"""
            , """<ul>"""
            , """<li>Do the dishes</li>"""
            , """<li>Do the laundry</li>"""
            , """<li>Do the dishes</li>"""
            , """<li>Do the laundry</li>"""
            , """<li>Do the dishes</li>"""
            , """<li>Make a better list</li>"""
            ]
    in
    { title = "Intrepid Shape"
    , body = [ holyGrail articleContent [ ("Home", Gen.Route.Home_ ), ("OtherPage", Gen.Route.OtherPage)] ]
    }

