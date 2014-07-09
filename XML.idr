module XML

import Data.SortedMap

mutual
  data Content = Elem Element | Text String

  record Element : Type where
    MkElement : (name : String ) ->
              (attributes : SortedMap String String) ->
              (children : List Content) ->
              Element

elemConstructor : Type
elemConstructor = (attributes : SortedMap String String) -> (children : List Content) -> Element

head : elemConstructor
head = MkElement "head"

body : elemConstructor
body = MkElement "body"
