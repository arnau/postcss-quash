module Main where

import Prelude (Unit, map, show, (++))
import Data.List (List, toList)
import Data.Foldable (foldl)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)


type Rule =
  { selector :: String
  , nodes :: Decls
  }

type Decls = List Decl

type Decl =
  { prop :: String
  , value  :: String
  }

showDecl :: Decl -> String
showDecl decl = decl.prop ++ ": " ++ decl.value

showDecls :: Decls -> String
showDecls xs = show (foldl (++) "" (map showDecl xs))

showRule :: Rule -> String
showRule rule = rule.selector ++ " {\n" ++
                showDecls rule.nodes ++
                "\n}"

foo :: Decl
foo = { prop : "color", value : "red" }

bar :: Rule
bar = { selector : "10%"
      , nodes : toList [foo]
      }

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  {-- log (showDecl foo) --}
  log (showRule bar)


{-- asNumber :: String -> Number --}
{-- asNumber x = do --}
{--   x :: Number --}

{-- export function bySelector(contrast) { --}
{--   return ({selector}) => contrast === selector; --}
{-- } --}

{-- export function byProp(contrast) { --}
{--   return ({prop}) => contrast === prop; --}
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

{-- function squashDecls(acc, node) { --}
{--   let decl = acc.find(byProp(node.prop)); --}

{--   if (isUndefined(decl)) { --}
{--     acc.unshift(node); --}
{--   } --}

{--   return acc; --}
{-- } --}
