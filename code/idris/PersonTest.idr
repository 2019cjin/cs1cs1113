module People

import list
import Person
import bool

{- mapAge: list Person -> list Nat
mapAge nil = nil
mapAge (h :: t) = (age h)::(mapAge t)

map: (a -> b) -> list a -> list b
map nil = nil
map f (h :: t) = (f h) :: (map f t) -}

-- An example value of type Person
tommy: Person
tommy = MkPerson "Tommy" 3

-- And now here's the key idea: The
-- names of the fields are automatically
-- names of projection functions! Here
-- we get out the age of person, p.
t: Nat
t = age p
-- expect 3

-- Here we get the name of person p.
n: String
n = name p
-- expect "Tommy"

-- new Person values
bob: Person
bob = MkPerson "Bob" 12

jill: Person
jill = MkPerson "Jill" 6

sam: Person
sam = MkPerson "Sam" 15
