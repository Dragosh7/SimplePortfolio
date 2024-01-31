module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)
import List exposing(..)


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


sortByInterval : List Event -> List Event
sortByInterval events =
    List.sortWith (\e1 e2 -> Interval.compare e1.interval e2.interval) events    -- events
    --Debug.todo "Implement Event.sortByInterval"


view : Event -> Html Never
view event =
      div [class "event", classList [("event-important", event.important)]] 
        [ 
        h1 [class "event-title"] [text event.title],
        p [class "event-description"][ event.description],
        p [class "event-category"][categoryView event.category],
        p [class "event-interval"][Interval.view event.interval],
        p [class "event-url"][  a [ href (Maybe.withDefault "" event.url) ] [text "Link"]]
        --     case event.url of
        --         Just link -> a [class "event-url", href link] [text "Link"]
        --         Nothing -> text "No Link"

    ]
   -- Debug.todo "Implement the Model.Event.view function"
