module dna

import list
import pair
import nat

data base = A | T | G | C

complement_base: base -> base
complement_base A = T
complement_base T = A
complement_base G = C
complement_base C = G

complement_strand: list base -> list base
complement_strand b = map complement_base b

strand1: list (pair base base) -> list base
strand1 s = map fst s

strand2: list (pair base base) -> list base
strand2 s = map snd s

complement_pair: base -> pair base base
complement_pair b = mkPair b (complement_base b)

complete: list base -> list (pair base base)
complete s = map complement_pair s

isBase: base -> base -> nat
isBase A A = S O
isBase T T = S O
isBase G G = S O
isBase C C = S O
isBase _ _ = O

countBase: list base -> base -> nat
countBase l b = list.foldr add O (map (isBase b) l)
