module colors

import pair
import bool

%default total

data color = red | green | blue | cyan | magenta | yellow

complement: color -> color
complement red = cyan
complement cyan = red
complement green = magenta
complement magenta = green
complement blue = yellow
complement yellow = blue

additive: color -> bool
additive red = true
additive green = true
additive blue = true
additive _ = false 

subtractive: color -> bool
subtractive t = not (additive t)

complements: pair color color -> bool
complements (mkPair red cyan) = true
complements (mkPair green magenta) = true
complements (mkPair blue yellow) = true 
complements (mkPair a b) = complements (mkPair b a)
complements _ = false

mixink: pair color color -> color 
mixink (mkPair yellow cyan) = green
mixink (mkPair yellow magenta) = red
mixink (mkPair cyan magenta) = blue
mixink (mkPair a b) = mixink (mkPair b a)
