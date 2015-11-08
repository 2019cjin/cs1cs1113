module pairTest

import pair
import bool
import unit
import days

p1: pair bool bool
p1 = mkPair true false

p2: pair unit bool
p2 = mkPair mkUnit false

p3: pair days bool
p3 = mkPair monday true
