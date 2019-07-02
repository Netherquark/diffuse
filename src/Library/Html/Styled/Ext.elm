module Html.Styled.Ext exposing (ifEnterKey, onDoubleTap, onEnterKey)

import Html.Styled exposing (Attribute)
import Html.Styled.Events exposing (keyCode, on)
import Json.Decode as Json


onDoubleTap : msg -> Attribute msg
onDoubleTap msg =
    on "dbltap" (Json.succeed msg)


{-| Event binding for the `Enter` key.
-}
onEnterKey : msg -> Attribute msg
onEnterKey msg =
    on "keydown" (Json.andThen (ifEnterKey msg) keyCode)


ifEnterKey : msg -> Int -> Json.Decoder msg
ifEnterKey msg key =
    case key of
        13 ->
            Json.succeed msg

        _ ->
            Json.fail "Another key, that isn't enter, was pressed"
