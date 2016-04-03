module Data.CSS.Rule ( Rule
                     , Rules
                     , showRule
                     ) where

import Prelude ((++))
import Data.List (List)

import Data.CSS.Decl (Decls, showDecls)


type Rule =
  { selector :: String
  , nodes :: Decls
  }

type Rules = List Rule


showRule :: Rule -> String
showRule rule = rule.selector ++ " {\n" ++
                showDecls rule.nodes ++
                "\n}"
