module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, button, div, h1, img, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)



---- MODEL ----


type ThemeOption
    = Dark
    | Light


type alias Model =
    { theme : ThemeOption
    }


init : ( Model, Cmd Msg )
init =
    ( { theme = Light }, Cmd.none )



---- UPDATE ----


type Msg
    = ToggleTheme ThemeOption


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggleTheme theme ->
            ( { model | theme = theme }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    let
        themeClass =
            case model.theme of
                Dark ->
                    "dark-theme"

                Light ->
                    "light-theme"
    in
    div [ class themeClass ]
        [ h1 [] [ text "Demo Elm App" ]
        , div [] [ text "Choose a Theme" ]
        , div []
            [ button [ onClick (ToggleTheme Light) ] [ text "Light" ]
            , button [ onClick (ToggleTheme Dark) ] [ text "Dark" ]
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
