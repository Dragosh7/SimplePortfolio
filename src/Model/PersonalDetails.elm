module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id, href, style)
import List exposing (..)
import String exposing (fromList)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
     div [] [
        h1 [id "name", style "color" "#EB455F", style "font-family" "Arial, sans-serif"] [text details.name],
        em [id "intro"] [text details.intro],
        ul [] (List.map (\x -> li [class "contact-detail"] [text (String.concat [x.name, x.detail])]) details.contacts),
        ul [] (List.map (\x -> li [class "social-link"] [a [href x.detail] [text x.name]]) details.socials)
     ]
    --Debug.todo "Implement the Model.PersonalDetails.view function"
