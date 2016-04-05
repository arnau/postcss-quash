module PostCSS.Quash (asNumber) where

import Global (readFloat)

-- Alias to keep consistency with the original implementation
asNumber :: String -> Number
asNumber = readFloat


