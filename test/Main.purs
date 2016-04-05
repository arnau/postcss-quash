module Test.Main where

import Prelude (Unit)
import Data.List (toList)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

import PostCSS.Quash (asNumber)
import Data.CSS.Rule (Rule, showRule)
import Data.CSS.Decl (Decl, showDecl)

foo :: Decl
foo = { prop : "color", value : "red" }

foo' :: Decl
foo' = { prop : "background-color", value : "black" }


bar :: Rule
bar = { selector : "10%"
      , nodes : toList [ { prop : "color", value : "red" }
                       , { prop : "color", value : "blue" }
                       , { prop : "background-color", value : "white" }
                       , { prop : "color", value : "green" }
                       ]
      }

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log (showRule bar)
  {-- log (show (showDecl <$> Data.CSS.Decl.find "color" bar.nodes)) --}
