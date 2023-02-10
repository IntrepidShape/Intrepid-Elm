# IntrepidShape - Elm Calculator Tutorial

In this tutorial, we'll show you how to create a basic calculator application in Elm. We'll start with a basic overview of the Elm language, then move on to more complex concepts, such as user interaction and data flow. By the end of this tutorial, you should have a working calculator application that you can use and expand on.

Lets first get a little boilerplate out of the way, this will allow you to use some functions inside the `Browser` amd `Html` Packages. The module name should be the same name of the file, in this case `CalculatorTutorial` for `CalculatorTutorial.elm`.

```elm
module CalculatorTutorial exposing (..)

import Browser
import Html exposing (Attribute, Html, br, button, div, form, input, option, select, text)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick)
import Html.Events.Extra exposing (onChange)

```

To get started, let's take a look at the Elm language. Elm is a functional programming language that is statically typed and has a declarative syntax. This means that Elm code is written in a way that is easy to read and understand. Elm also has a strong focus on user experience, so you can quickly create beautiful, interactive applications.

Now that we've covered the basics of Elm, let's start building our calculator application. The first step is to create a basic structure for our application. Elm uses a Model-View-Update (MVU) architecture for its applications, so we'll use this for our calculator. The model will be responsible for storing the state of our application, the view will be responsible for creating the UI, and the update will be responsible for handling user interactions.


We'll start by creating a `Model` type to store the state of our application. The model will contain the two numbers that the user enters, the operator for the calculation, and the result of the calculation. All of these values are floats, except for the operator, which is a string.

```elm
type alias Model =
    { number1 : Float
    , number2 : Float
    , operator : String
    , result : Float
    }
```

Next, we need to create an `init` function to initialize our application. This function will take a `flags` argument and return a tuple containing our model and a `Cmd Msg` (which is used to handle side effects). In our case, we don't need any side effects, so we can just return an empty `Cmd Msg`.

```elm
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
```

Now that we have our model and init function set up, we can move on to handling user interactions. This is done with the `update` function. The `update` function takes a `Msg` (which is used to handle user actions) and a `Model` and returns a tuple containing the updated model and a `Cmd Msg`. Depending on which message is passed, the model will be updated accordingly. 
For example, if the message is `Number1Changed`, the `number1` field of the model will be set to the value passed in the message. Similarly, if the message is `OperatorChanged`, the `operator` field of the model will be set to the value passed in the message. 
If the message is `Calculate`, then the result will be calculated based on the operator and the numbers stored in the model and set as the result of the model. 
In all cases, the `Cmd` is set to `none` as there is no command to be run. 

```elm
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
```  

 Now that we have our data flow set up, it's time to create our view. The view takes a `Model` and returns an `Html Msg`. We'll use this view to create two input fields for entering numbers and a select field for selecting an operator. We'll also use an onInput event to update the model with the values entered in the input fields and an onChange event to update the operator in the model with the value selected in the select field. Finally, we'll use an onClick event to run the Calculate command when the Calculate button is clicked. The result will then be displayed in the view. Here's what our view looks like: 

 ```elm 

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
``` 

That's it! We now have a basic calculator application built in Elm. You can now use this application to add, subtract, multiply, and divide numbers. You can also expand on this application to make it more complex and user friendly. 

We hope you enjoyed this tutorial and learned something new about Elm. Thanks for following along!