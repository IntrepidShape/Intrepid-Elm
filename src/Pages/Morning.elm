module Pages.Morning exposing (Model, Msg, page)

import Css exposing (..)
import Date exposing (Date, Interval(..), Unit(..))
import File.Download as Download
import Html.Events
import Html.Styled as Html exposing (Html, form)
import Html.Styled.Attributes as Html exposing (css)
import Html.Styled.Events as Html exposing (onSubmit)
import Json.Encode as Encode
import Page
import Pages.Home_ exposing (holyGrail)
import Request exposing (Request)
import Shared as Shared exposing (Model)
import Task
import Time exposing (Month(..))
import View exposing (View)



-- Journal
-- A Goal journal
-- Steps to create a goal journal
-- Develop a well-defined goal setting process: You should have a clear and concise goal setting process in order to help users track their progress and stay motivated. This should include the ability to set short-term and long-term goals, track progress, and receive feedback and rewards when goals are achieved.
-- Design an effective user interface: An effective user interface should be intuitive and easy to use. It should also be visually appealing and engaging in order to keep users engaged.
-- Support social interaction: Social interaction is key to helping users stay motivated and accountable. You should allow users to share their goals and achievements with other users, as well as provide tools for messaging, commenting, and other forms of communication.
-- Incorporate gamification elements: Gamification elements such as leaderboards, badges, and rewards can help drive engagement and motivate users to keep working towards their goals.
-- Integrate analytics: Analytics can help you track user behavior, identify areas of improvement, and improve the user experience.
-- Incorporate feedback mechanisms: Feedback mechanisms such as surveys and polls can help you understand user needs and preferences, and make improvements accordingly.
-- Sudo code
-- Promt the user to input a jounrnal entry
-- Twice a day the user will be prompted to input a journal entry
-- Morning and evening
-- types of journal entries
--
-- Planing and mindset
---- Gratitude
---- Restate the Long term goal
------ What is the goal?
------ What are you doing today to move towards your long term goal
------ What does it mean to you?
------ What is the value of this goal to you?
------ What is the value of this goal to others?
---- Short Todays goals
------ What do I need to get done today?
------ What are my top 3 priorities for today?
------ Am I doing them in the order of the hardest first?
-- Reflection
---- Top life experience of the day.
---- Things that could have been improved
---- How I improved them, or how I will improve them tomorrow
---- Rate the day on a scale of 1-10
---- Rate the amount of focus I embodied on a scale of 1-10
---- Rate the amount of energy I embodied on a scale of 1-10
---- Rate the amount of happiness I embodied on a scale of 1-10
---- Did I accomplish my goals for the day
---- What did I learn today
---- Final free form journal entry
-- type alias Morning =
--     { gratitude : String
--     , longTermGoal : String
--     , shortTermGoals : String
--     , planForTheDay : String
--     , lookingForward : String
--     , rateFocus : Int
--     , rateEnergy : Int
--     , rateHappiness : Int
--     }
-- The location of this comment doesnt matter, what I'm trying to do is change calander.elm and import the functionality into this file


type alias Model =
    { date : Date
    , gratitude : String
    , longTermGoal : String
    , shortTermGoals : String
    , planForTheDay : String
    , lookingForward : String
    , rateFocus : Int
    , rateEnergy : Int
    , rateHappiness : Int
    }



-- type alias Evening =
--     { lifeExperience : String
--     , improvements : String
--     , improvementsImprovements : String
--     , rateDay : Int
--     , rateFocus : Int
--     , rateEnergy : Int
--     , rateHappiness : Int
--     , goalsAccomplished : Bool
--     , learnings : String
--     , freeForm : String
--     }


type Msg
    = Updategratitude String
    | UpdateLongTermGoal String
    | UpdateShortTermGoals String
    | UpdatePlanForTheDay String
    | UpdateLookingForward String
    | UpdateRateFocus Int
    | UpdateRateEnergy Int
    | UpdateRateHappiness Int
    | MorningSubmitted Model
    | ReceiveDate Date
    | NoOp


init : ( Model, Cmd Msg )
init =
    ( { date = Date.fromCalendarDate 2023 Jan 1
      , gratitude = ""
      , longTermGoal = ""
      , shortTermGoals = ""
      , planForTheDay = ""
      , lookingForward = ""
      , rateFocus = 0
      , rateEnergy = 0
      , rateHappiness = 0
      }
    , Task.perform ReceiveDate Date.today
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Updategratitude val ->
            ( { model | gratitude = val }, Cmd.none )

        UpdateLongTermGoal val ->
            ( { model | longTermGoal = val }, Cmd.none )

        UpdateShortTermGoals val ->
            ( { model | shortTermGoals = val }, Cmd.none )

        UpdatePlanForTheDay val ->
            ( { model | planForTheDay = val }, Cmd.none )

        UpdateLookingForward val ->
            ( { model | lookingForward = val }, Cmd.none )

        UpdateRateFocus val ->
            ( { model | rateFocus = val }, Cmd.none )

        UpdateRateEnergy val ->
            ( { model | rateEnergy = val }, Cmd.none )

        UpdateRateHappiness val ->
            ( { model | rateHappiness = val }, Cmd.none )

        MorningSubmitted val -> -- download the morning to the local computer in json format using downloadMorning function
            ( model , downloadMorning val )
            
            

        ReceiveDate val ->
            ( { model | date = val }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


page : Shared.Model -> Request -> Page.With Model Msg
page _ _ =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


view : Model -> View Msg
view morning =
    let
        articleContent : List (Html Msg)
        articleContent =
            [ Html.div
                [ css
                    [ displayFlex
                    , flexDirection column
                    , alignItems center
                    , justifyContent center
                    ]
                ]
                [ Html.h1 []
                    [ Html.text "Morning"
                    ]
                , form
                    [ css
                        [ displayFlex
                        , flexDirection column
                        , alignItems center
                        , justifyContent center
                        ]
                    ]
                    [ Html.text (morning.date |> Date.format "EEEE, d MMMM y")
                    , Html.div
                        [ css
                            [ displayFlex
                            , flexDirection column
                            , alignItems center
                            , justifyContent center
                            , padding (pct 5)
                            ]
                        ]
                        [ Html.label [] [ Html.text "Gratitude" ]
                        , Html.textarea
                            [ css
                                [ width (px 960)
                                , height (px 230)
                                ]
                            , Html.value morning.gratitude
                            , Html.onInput Updategratitude
                            ]
                            []
                        ]
                    , Html.div
                        [ css
                            [ displayFlex
                            , flexDirection column
                            , alignItems center
                            , justifyContent center
                            ]
                        ]
                        [ Html.label [] [ Html.text "Long Term Goal" ]
                        , Html.textarea
                            [ css
                                [ width (px 960)
                                , height (px 230)
                                ]
                            , Html.value morning.longTermGoal
                            , Html.onInput UpdateLongTermGoal
                            ]
                            []
                        ]
                    , Html.div
                        [ css
                            [ displayFlex
                            , flexDirection column
                            , alignItems center
                            , justifyContent center
                            , padding (px 20)
                            ]
                        ]
                        [ Html.label [] [ Html.text "Short Term Goals" ]
                        , Html.textarea
                            [ css
                                [ width (px 960)
                                , height (px 230)
                                ]
                            , Html.value morning.shortTermGoals
                            , Html.onInput UpdateShortTermGoals
                            ]
                            []
                        ]
                    , Html.div
                        [ css
                            [ displayFlex
                            , flexDirection column
                            , alignItems center
                            , justifyContent center
                            , padding (px 20)
                            ]
                        ]
                        [ Html.label [] [ Html.text "Plan for the day" ]
                        , Html.textarea
                            [ css
                                [ width (px 960)
                                , height (px 230)
                                ]
                            , Html.value morning.planForTheDay
                            , Html.onInput UpdatePlanForTheDay
                            ]
                            []
                        ]
                    , Html.div
                        [ css
                            [ displayFlex
                            , flexDirection column
                            , alignItems center
                            , justifyContent center
                            , padding (px 20)
                            ]
                        ]
                        [ Html.label [] [ Html.text "Looking forward to" ]
                        , Html.textarea
                            [ css
                                [ width (px 960)
                                , height (px 230)
                                ]
                            , Html.value morning.lookingForward
                            , Html.onInput UpdateLookingForward
                            ]
                            []
                        ]
                    , Html.div
                        [ css
                            [ displayFlex
                            , flexDirection column
                            , alignItems center
                            , justifyContent center
                            , padding (px 20)
                            ]
                        ]
                        [ Html.label [] [ Html.text "Rate Focus" ]
                        , Html.div
                            [ css
                                [ displayFlex
                                , flexDirection column
                                , alignItems center
                                , justifyContent center
                                , padding (px 5)
                                ]
                            ]
                            [ Html.text (String.fromInt morning.rateFocus) ]
                        , Html.input
                            [ css
                                [ width (px 960)
                                , height (px 230)
                                ]
                            , Html.type_ "range"
                            , Html.min "0"
                            , Html.max "10"
                            , Html.value (String.fromInt morning.rateFocus)
                            , Html.onInput (toMsg String.toInt UpdateRateFocus)
                            ]
                            []
                        ]
                    , Html.div
                        [ css
                            [ displayFlex
                            , flexDirection column
                            , alignItems center
                            , justifyContent center
                            , padding (px 20)
                            ]
                        ]
                        [ Html.label [] [ Html.text "Rate Energy" ]
                        , Html.div
                            [ css
                                [ displayFlex
                                , flexDirection column
                                , alignItems center
                                , justifyContent center
                                , padding (px 5)
                                ]
                            ]
                            [ Html.text (String.fromInt morning.rateEnergy) ]
                        , Html.input
                            [ css
                                [ width (px 960)
                                , height (px 230)
                                ]
                            , Html.type_ "range"
                            , Html.min "0"
                            , Html.max "10"
                            , Html.value (String.fromInt morning.rateEnergy)
                            , Html.onInput (toMsg String.toInt UpdateRateEnergy)
                            ]
                            []
                        ]
                    , Html.div
                        [ css
                            [ displayFlex
                            , flexDirection column
                            , alignItems center
                            , justifyContent center
                            , padding (px 20)
                            ]
                        ]
                        [ Html.label [] [ Html.text "Rate Happiness" ]
                        , Html.div
                            [ css
                                [ displayFlex
                                , flexDirection column
                                , alignItems center
                                , justifyContent center
                                , padding (px 5)
                                ]
                            ]
                            [ Html.text (String.fromInt morning.rateHappiness) ]
                        , Html.input
                            [ css
                                [ width (px 960)
                                , height (px 230)
                                ]
                            , Html.type_ "range"
                            , Html.min "0"
                            , Html.max "10"
                            , Html.value (String.fromInt morning.rateHappiness)
                            , Html.onInput (toMsg String.toInt UpdateRateHappiness)
                            ]
                            []
                        ]
                    , Html.button -- on click Morning submitted
                        [ css
                            [ displayFlex
                            , flexDirection column
                            , alignItems center
                            , justifyContent center
                            , padding (px 20)
                            ]
                        , Html.onClick (MorningSubmitted morning)
                        ]
                        [ Html.text "Submit Morning" ]
                    ]
                ]
            ]
    in
    { title = "Intrepid Shape"
    , body = [ holyGrail articleContent ]
    }


toMsg : (String -> Maybe a) -> (a -> Msg) -> String -> Msg
toMsg toA toMsgFunc string =
    case toA string of
        Just a ->
            toMsgFunc a

        Nothing ->
            NoOp


encodeMorning : Model -> Encode.Value
encodeMorning morning =
    Encode.object
        [ ( "date", Encode.string (Date.format "dd-MM-yyy" morning.date) )
        , ( "gratitude", Encode.string morning.gratitude )
        , ( "longTermGoal", Encode.string morning.longTermGoal )
        , ( "shortTermGoals", Encode.string morning.shortTermGoals )
        , ( "planForTheDay", Encode.string morning.planForTheDay )
        , ( "lookingForward", Encode.string morning.lookingForward )
        , ( "rateFocus", Encode.int morning.rateFocus )
        , ( "rateEnergy", Encode.int morning.rateEnergy )
        , ( "rateHappiness", Encode.int morning.rateHappiness )
        ]


prettyMorningJson : Model -> String
prettyMorningJson morning =
    Encode.encode 4 (encodeMorning morning)


downloadMorning : Model -> Cmd Msg
downloadMorning morning =
    let
        filename =
            "morning-" ++ Date.format "dd-MM-yyy" morning.date ++ ".json"

        content =
            prettyMorningJson morning
    in
    Download.string filename "application/json" content



-- End of file
