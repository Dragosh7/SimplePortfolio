module Model.Repo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Json.Decode as De


type alias Repo =
    { name : String
    , description : Maybe String
    , url : String
    , pushedAt : String
    , stars : Int
    }


view : Repo -> Html msg
view repo =
    div [class "repo"] [
        div [class "repo-name"] [text repo.name],
        div [class "repo-description"] [
            case repo.description of
                 Just desc -> text desc
                 Nothing -> text "No description" ],
        div [class "repo-url"] [a [href repo.url] [text "Repo Link"]],
        div [class "repo-stars"] [text <| "Stars: " ++ String.fromInt repo.stars]
    ]
   -- Debug.todo "Implement Model.Repo.view"


sortByStars : List Repo -> List Repo
sortByStars repos =
    List.sortWith (\s1 s2 -> if (s1.stars < s2.stars) then LT 
                            else if(s1.stars > s2.stars) then GT
                            else EQ) repos
    -- []
    --Debug.todo "Implement Model.Repo.sortByStars"


{-| Deserializes a JSON object to a `Repo`.
Field mapping (JSON -> Elm):

  - name -> name
  - description -> description
  - html\_url -> url
  - pushed\_at -> pushedAt
  - stargazers\_count -> stars

-}
decodeRepo : De.Decoder Repo
decodeRepo =
     De.map5 Repo
            ( De.field "name" De.string )
            ( De.field "description" (De.maybe De.string))
            ( De.field "html_url" De.string)
            ( De.field "pushed_at" De.string)
            ( De.field "stargazers_count" De.int)
    --Debug.todo "Implement Model.Repo.decodeRepo"
