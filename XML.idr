module XML

import Data.SortedMap

%default total

mutual
  data Content = Elem Element | Text String

  record Element : Type where
    MkElement : (name : String ) ->
                (attributes : SortedMap String String) ->
                (children : List Content) ->
                Element

elemConstructor : Type
elemConstructor = (children : List Content) -> Content

mkContent : String -> List Content -> Content
mkContent name xs = Elem (MkElement name Empty xs)

html : elemConstructor
html = mkContent "html"

head : elemConstructor
head = mkContent "head"

body : elemConstructor
body = mkContent "body"

p : elemConstructor
p = mkContent "p"

page : Content
page = html [head [], body [p [Text "Hello"]]]

instance Show Content where
  show (Text x) = x
  show (Elem (MkElement name attributes children)) = "<" ++ name ++ ">" ++ concatMap show children ++ "</" ++ name ++ ">"
