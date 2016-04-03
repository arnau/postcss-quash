module Main where

import Prelude (Unit, show, ($), (<$>))
import Data.List (toList)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

import Data.CSS.Rule (Rule, showRule)
import Data.CSS.Decl (Decl, showDecl)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log "foo!"
