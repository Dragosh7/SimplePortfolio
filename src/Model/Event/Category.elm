module Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, allSelected, eventCategories, isEventCategorySelected, set, view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (checked, class, style, type_)
import Html.Events exposing (onCheck)
import List exposing (..)


type EventCategory
    = Academic
    | Work
    | Project
    | Award


eventCategories =
    [ Academic, Work, Project, Award ]


{-| Type used to represent the state of the selected event categories
-}
type SelectedEventCategories
    = All
    | None
    | Some (List EventCategory)


{-| Returns an instance of `SelectedEventCategories` with all categories selected

    isEventCategorySelected Academic allSelected --> True

-}
allSelected : SelectedEventCategories
allSelected = All
    -- TODOCompleteThisType
    --Debug.todo "Implement Model.Event.Category.allSelected"

{-| Returns an instance of `SelectedEventCategories` with no categories selected

-- isEventCategorySelected Academic noneSelected --> False

-}
noneSelected : SelectedEventCategories
noneSelected = None
    -- TODOCompleteThisType
    --Debug.todo "Implement Model.Event.Category.noneSelected"

{-| Given a the current state and a `category` it returns whether the `category` is selected.

    isEventCategorySelected Academic allSelected --> True

-}
isEventCategorySelected : EventCategory -> SelectedEventCategories -> Bool
isEventCategorySelected category current =
    case current of
        All -> True

        None -> False

        Some selectedCategories -> List.member category selectedCategories
        
    -- False
    --Debug.todo "Implement Model.Event.Category.isEventCategorySelected"


{-| Given an `category`, a boolean `value` and the current state, it sets the given `category` in `current` to `value`.

    allSelected |> set Academic False |> isEventCategorySelected Academic --> False

    allSelected |> set Academic False |> isEventCategorySelected Work --> True

-}
set : EventCategory -> Bool -> SelectedEventCategories -> SelectedEventCategories
set category value current =
    case current of
        All -> if value then All else Some (List.filter (\c -> c /= category) eventCategories)

        None -> if value then Some [category] else None

        Some selectedCategories -> if value then Some (List.concat [selectedCategories, [category]])
                                else Some (List.filter (\c -> c /= category) selectedCategories)
    -- current
    --Debug.todo "Implement Model.Event.Category.set"


checkbox : String -> Bool -> EventCategory -> Html ( EventCategory, Bool )
checkbox name state category =
    div [ style "display" "inline", class "category-checkbox" ]
        [ input [ type_ "checkbox", onCheck (\c -> ( category, c )), checked state ] []
        , text name
        ]


view : SelectedEventCategories -> Html (EventCategory, Bool)
view model =
    div [] (concatMap (checkboxView model) eventCategories)

checkboxView : SelectedEventCategories -> EventCategory -> List (Html (EventCategory, Bool))
checkboxView model category =
    let
        checkedState = isEventCategorySelected category model
    in
    [checkbox ( case category of
                                Academic -> "Academic"
                                Work -> "Work"
                                Project -> "Project"
                                Award -> "Award") checkedState category]
   
   -- Debug.todo "Implement the Model.Event.Category.view function"
