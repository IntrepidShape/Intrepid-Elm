module Pages.Journal exposing (Model, Msg, page)

import Css exposing (..)
import Gen.Route exposing (Route)
import Html.Styled as Html exposing (Html, form)
import Html.Styled.Attributes as Html exposing (css)
import Html.Styled.Events as Html exposing (onClick, onInput, onSubmit, preventDefaultOn)
import Page exposing (Page, With)
import Pages.Home_ exposing (holyGrail)
import Request exposing (Request)
import Shared as Shared exposing (Model)
import Task
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
-- 1. Planing and mindset
-- 1.1 Gratitude
-- 1.2 Restate the Long term goal
-- 1.2.1 What is the goal?
-- 1.2.2 What are you doing today to move towards your long term goal
-- 1.2.3 What does it mean to you?
-- 1.2.4 What is the value of this goal to you?
-- 1.2.5 What is the value of this goal to others?
-- 1.3 Short Todays goals
-- What do I need to get done today?
-- What are my top 3 priorities for today?
-- Am I doing them in the order of the hardest first?
-- Reflection
-- Top life experience of the day.
-- Things that could have been improved
-- How I improved them, or how I will improve them tomorrow
-- Rate the day on a scale of 1-10
-- Rate the amount of focus I embodied on a scale of 1-10
-- Rate the amount of energy I embodied on a scale of 1-10
-- Rate the amount of happiness I embodied on a scale of 1-10
-- Did I accomplish my goals for the day
-- What did I learn today
-- Final free form journal entry


type alias Day =
    { morning : Model
    , evening : Evening
    }


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

type alias Model =
    { gratitude : String
    , longTermGoal : String
    , shortTermGoals : String
    , planForTheDay : String
    , lookingForward : String
    , rateFocus : Int
    , rateEnergy : Int
    , rateHappiness : Int
    }

type alias Evening =
    { lifeExperience : String
    , improvements : String
    , improvementsImprovements : String
    , rateDay : Int
    , rateFocus : Int
    , rateEnergy : Int
    , rateHappiness : Int
    , goalsAccomplished : Bool
    , learnings : String
    , freeForm : String
    }


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
    | NoOp


init : Model
init =
    { gratitude = ""
    , longTermGoal = ""
    , shortTermGoals = ""
    , planForTheDay = ""
    , lookingForward = ""
    , rateFocus = 0
    , rateEnergy = 0
    , rateHappiness = 0
    }

update : Msg -> Model -> Model
update msg model =
    case msg of
        Updategratitude val ->
            { model | gratitude = val }

        UpdateLongTermGoal val ->
            { model | longTermGoal = val }

        UpdateShortTermGoals val ->
            { model | shortTermGoals = val }

        UpdatePlanForTheDay val ->
            { model | planForTheDay = val }

        UpdateLookingForward val ->
            { model | lookingForward = val }

        UpdateRateFocus val ->
            { model | rateFocus = val }

        UpdateRateEnergy val ->
            { model | rateEnergy = val }

        UpdateRateHappiness val ->
            { model | rateHappiness = val }

        MorningSubmitted val ->
            val
        
        NoOp ->
            model




page : Shared.Model -> Request -> Page.With Model Msg
page shared req =
    Page.sandbox
        { init = init
        , update = update
        , view = view
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
                [ Html.h1 [] [ Html.text "Journal" ]
                , form
                    [ css
                        [ displayFlex
                        , flexDirection column
                        , alignItems center
                        , justifyContent center
                        ]
                    ]
                    [ Html.div
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
                            , Html.onInput ( toMsg String.toInt UpdateRateEnergy)
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
                            , Html.onInput ( toMsg String.toInt UpdateRateHappiness)
                            ]
                            []
                        ]
                    , Html.button
                        [ css
                            [ width (px 400)
                            , height (px 100) 
                            ]
                        ]
                        [ Html.text "Submit" ]
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
        Just a -> toMsgFunc a
        Nothing -> NoOp

saveMorning : Model -> Cmd Msg
saveMorning morning =
    Task.perform (\_ -> MorningSubmitted morning) (Task.succeed morning)



