module CalculatorTutorial exposing (..)

-- Written by Intrepid Shape for learning use.
{-|
    This is a calculator app written in Elm. 
    It allows the user to enter two numbers and an operator and then calculates the result. 
    The model is initialized with the number1, number2 and operator set to 0 and "+" respectively. 
    The result is also set to 0. 
    The view has two input fields for entering the numbers and a select field for selecting the operator. 
    The onInput events are used to update the model with the values entered in the input fields. 
    The onChange event is used to update the operator in the model with the value selected in the select field. 
    The onClick event is used to run the Calculate command when the Calculate button is clicked. 
    The result is displayed in the view. 
    The update function takes a Msg and a Model and returns a tuple of type (Model, Cmd Msg). 
    Depending on which message is passed, the model is updated accordingly. 
    The main function is used to create the program. 
    The init, view and update functions are passed to the Browser.element function along with the subscriptions set to none. 
    This creates the program and runs it in the browser.
-}


import Browser
import Html exposing (Attribute, Html, br, button, div, form, input, option, select, text)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick)
import Html.Events.Extra exposing (onChange)


-- MAIN
{-|
    The main function is used to create the program. 
    The init, view and update functions are passed to the Browser.element function along with the subscriptions set to none. 
    This creates the program and runs it in the browser.
-}

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


-- MODEL
{-| 
    Model is a record type that holds the values of number1, number2, operator, result and prevResult. 
    These values are all floats except for the operator, which is a string.
-}


type alias Model =
    { number1 : Float
    , number2 : Float
    , operator : String
    , result : Float
    }

-- INIT
{-|
    The init function takes the flags argument and returns a tuple of type (Model, Cmd Msg). 
    The model is initialized with the number1, number2 and operator set to 0 and "+" respectively. 
    The result is also set to 0. 
    The Cmd is set to none as there is no command to be run at the start.
-}

init : flags -> ( Model, Cmd Msg )
init flags =
    let
        model =
            { number1 = 0
            , number2 = 0
            , operator = "+"
            , result = 0
            }
    in
    ( model, Cmd.none )


-- UPDATE

{-| 
    Update takes a Msg and a Model and returns a tuple of type (Model, Cmd Msg). 
    Depending on which message is passed, the model is updated accordingly. 
    If the message is Number1Changed, the number1 field of the model is set to the value passed in the message. 
    Similarly, if the message is OperatorChanged, the operator field of the model is set to the value passed in the message. 
    If the message is Calculate, the result is calculated based on the operator and the numbers stored in the model and set as the result of the model. 
    In all cases, the Cmd is set to none as there is no command to be run.
-}

type Msg
    = Calculate
    | Number1Changed Float
    | Number2Changed Float
    | OperatorChanged String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Number1Changed n1 ->
            ( { model | number1 = n1 }, Cmd.none )

        OperatorChanged op ->
            ( { model | operator = op }, Cmd.none )

        Number2Changed n2 ->
            ( { model | number2 = n2 }, Cmd.none )

        Calculate ->
            let
                result =
                    case model.operator of
                        "+" ->
                            model.number1 + model.number2

                        "-" ->
                            model.number1 - model.number2

                        "*" ->
                            model.number1 * model.number2

                        "/" ->
                            model.number1 / model.number2

                        _ ->
                            0
            in
            ( { model | result = result }, Cmd.none )

-- VIEW
{-| View takes a Model and returns an Html Msg. 
    The view has two input fields for entering the numbers and a select field for selecting the operator. 
    The onInput events are used to update the model with the values entered in the input fields. 
    The onChange event is used to update the operator in the model with the value selected in the select field. 
    The onClick event is used to run the Calculate command when the Calculate button is clicked. 
    The result is displayed in the view.
-}

view : Model -> Html Msg
view model =
    div []
        [ input [ Html.Events.onInput (Number1Changed << Maybe.withDefault 0.0 << String.toFloat) ]
            [ Html.text "Enter number 1"
            , Html.text (String.fromFloat model.number1)
            ]
        , select [ Html.Events.Extra.onChange OperatorChanged ]
            [ option [ value "+" ] [ text "+" ]
            , option [ value "-" ] [ text "-" ]
            , option [ value "*" ] [ text "*" ]
            , option [ value "/" ] [ text "/" ]
            ]
        , input [ Html.Events.onInput (Number2Changed << Maybe.withDefault 0.0 << String.toFloat) ]
            [ Html.text "Enter number 2"
            , Html.text (String.fromFloat model.number2)
            ]
        , button [ onClick Calculate ] [ text "Calculate" ]
        , text (" Result = " ++ String.fromFloat model.result)
        ]

--End of file