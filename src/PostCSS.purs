module PostCSS where

import Prelude
import Data.Function (Fn2)

foreign import calculateInterest :: Number -> Number

foreign import calculateInterest2 :: Fn2 Number Number Number

foreign import plugin :: Forall a String -> (a -> String) -> String
