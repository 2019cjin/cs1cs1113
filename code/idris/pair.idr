module pair

import eq
import bool

data pair a b = mkPair a b

fst: pair a b -> a
fst (mkPair f s) = f

snd: pair a b -> b
snd (mkPair f s) = s

-- constraints: a and b are members of type class eq.
instance (eq a, eq b) => eq (pair a b) where
  eql (mkPair v1 v2) (mkPair w1 w2) = and (eql v1 w1) (eql v2 w2)
