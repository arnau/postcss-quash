module Data.CSS.Rule ( Rule
                     , Rules
                     , showRule
                     ) where

import Prelude (map, show, (++), (==), (<<<), ($))
import Data.List (List(..), filter, head, (:))
import Data.Foldable (foldl, foldr)
import Data.Maybe (Maybe(..))
import Control.Plus (empty)


import Data.CSS.Decl (Decls, showDecls)


type Rule =
  { selector :: String
  , nodes :: Decls
  }

type Rules = List Rule

emptyRules :: Rules
emptyRules = empty

insertRule :: Rule -> Rules -> Rules
insertRule x xs = x : xs


find :: String -> Rules -> Maybe Rule
find selector = head <<< filter (eqBySelector selector)

eqBySelector :: String -> (Rule -> Boolean)
eqBySelector selector = (\x -> x.selector == selector)


showRule :: Rule -> String
showRule rule = rule.selector ++ " {\n" ++
                showDecls rule.nodes ++
                "\n}"

showRules :: Rules -> String
showRules xs = show
             $ foldl (++) ""
             $ map showRule
             $ squashRules xs

squashRules :: Rules -> Rules
squashRules xs = foldr uniqRule emptyRules xs

uniqRule :: Rule -> Rules -> Rules
uniqRule x xs =
  -- List.deleteAt requires the elem index which is unknown so far
  case (find x.selector xs) of
    Nothing -> x:xs
    Just(r) -> (insertRule { selector: r.selector
                           , nodes: x.nodes ++ r.nodes
                           }):xs



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



