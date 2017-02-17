module Types exposing (..)

import Date exposing (Date)
import Firebase.Auth
import Time exposing (Time)


-- Children

import Queue.Types as Queue
import Routing.Types as Routing


-- Types


type Msg
    = Authenticate
      -- Time
    | SetTimestamp Time
      -- Children
    | QueueMsg Queue.Msg
    | RoutingMsg Routing.Msg


type alias Model =
    { authenticatedUser : Maybe Firebase.Auth.User
    , showLoadingScreen : Bool
    , ------------------------------------
      -- Time
      ------------------------------------
      timestamp : Date
    , ------------------------------------
      -- Children
      ------------------------------------
      queue : Queue.Model
    , routing : Routing.Model
    }


type alias Settings =
    { queue : Queue.Settings
    }


type alias ProgramFlags =
    { settings : Settings
    , user : Maybe Firebase.Auth.User
    }
