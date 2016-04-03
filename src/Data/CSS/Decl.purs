module Data.CSS.Decl ( Decl
                     , Decls
                     , showDecl
                     , showDecls
                     , find
                     ) where

import Prelude (map, show, (++), (==), (<<<))
import Data.List (List, filter, head, (:))
import Data.Foldable (foldl, foldr)
import Data.Maybe (Maybe)
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
showDecls xs = show (foldl (++) "" (map showDecl xs))


{-- squashDecls :: Decls -> Decls --}
{-- squashDecls xs --}
{--   | [] => [] --}
{--   | xs => xs --}

{--   let decl = acc.find(byProp(node.prop)); --}

{--   if (isUndefined(decl)) { --}
{--     acc.unshift(node); --}
{--   } --}

{--   return acc; --}
{-- } --}


{-- asNumber :: String -> Number --}
{-- asNumber x = do --}
{--   x :: Number --}

{-- export function bySelector(contrast) { --}
{--   return ({selector}) => contrast === selector; --}
{-- } --}


{-- quash :: forall a. List a --}
{-- quash nodes = do --}
{--   rule.nodes.reduce(squashRules, []) --}
{--                              .sort(orderByPercentage); --}
{--     }) --}
{--   } --}
{-- }); --}

{-- function squashRules(acc, node) { --}
{--   let rule = acc.find(bySelector(node.selector)); --}

{--   if (isUndefined(rule)) { --}
{--     acc.push(node); --}
{--   } else { --}
{--     rule.nodes.push(...node.nodes); --}
{--     rule.nodes = rule.nodes.reduceRight(squashDecls, []); --}
{--   } --}

{--   return acc; --}
{-- } --}


