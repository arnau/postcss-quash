module Data.CSS.Decl ( Decl
                     , Decls
                     , showDecl
                     , showDecls
                     , find
                     ) where

import Prelude (map, show, (++), (==), (<<<), ($))
import Data.List (List(..), filter, head, (:))
import Data.Foldable (foldl, foldr)
import Data.Maybe (Maybe(..))
import Control.Plus (empty)

type Decl =
  { prop :: String
  , value  :: String
  }

type Decls = List Decl


emptyDecls :: Decls
emptyDecls = empty

insertDecl :: Decl -> Decls -> Decls
insertDecl x xs = x : xs

find :: String -> Decls -> Maybe Decl
find prop = head <<< filter (eqByProp prop)

eqByProp :: String -> (Decl -> Boolean)
eqByProp prop = (\x -> x.prop == prop)


showDecl :: Decl -> String
showDecl decl = decl.prop ++ ": " ++ decl.value ++ ";"

showDecls :: Decls -> String
showDecls xs = show
             $ foldl (++) ""
             $ map showDecl
             $ squashDecls xs

squashDecls :: Decls -> Decls
squashDecls xs = foldr uniqDecl emptyDecls xs

uniqDecl :: Decl -> Decls -> Decls
uniqDecl x xs =
  case (find x.prop xs) of
    Nothing -> x:xs
    _ -> xs


{-- quash :: forall a. List a --}
{-- quash nodes = do --}
{--   rule.nodes.reduce(squashRules, []) --}
{--                              .sort(orderByPercentage); --}
{--     }) --}
{--   } --}
{-- }); --}
