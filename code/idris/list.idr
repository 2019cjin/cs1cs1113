module list

import nat
import bool
import ite
import eq
import pair
import serialize

infixr 7 ::, ++

data list a = nil | (::) a (list a)

length: list a -> nat
length nil = O
length (m :: l') = S (length l')

||| append as inflix operator
(++): list a -> list a -> list a
(++) nil l2 = l2
(++) (h :: t) l2 = h :: (t ++ l2)

map: (a -> b) -> list a -> list b
map f nil = nil
map f (h::t) = (f h) :: (map f t)

{-give a list and predicate on elements. return the sublist of elements for
which the predicate is true.-}
filter: (a -> bool) -> list a -> list a
filter f nil = nil
filter f (h :: t) = ite (f h)
                        (h :: (filter f t))
                              (filter f t)

foldr: (a -> a -> a) -> a -> (list a) -> a
foldr f id nil = id
foldr f id (h :: t) = f h (list.foldr f id t)

-- if a is member of eq type class, then I can write this function
-- do this by saying (eq a) => a
member: (eq a) => a -> list a -> bool
member v nil = false
member v (h :: t) = ite (eql v h)
                        true
                        (member v t)

instance (eq a) => eq (list a) where
  eql nil nil = true
  eql (h :: t) (nil) = false
  eql (nil) (h :: t) = false
  eql (h1 :: t1) (h2 :: t2) = and (eql h1 h2) (eql t1 t2)

subset_elements: (eq a) => list a -> list a -> bool
subset_elements nil l = true
subset_elements (h1 :: t1) l = and (member h1 l) (subset_elements t1 l)

stringElements: (Serialize a) => list a -> String
stringElements nil = ""
stringElements (h :: nil) = toString h
stringElements (h :: (h2 :: t)) = (toString h) ++ ", " ++ (stringElements (h2 :: t))

instance (Serialize a) => Serialize (list a) where
  toString l = "[" ++ (stringElements l) ++ "]"
