module Box

import eq
import bool
import serialize

data Box t = mkBox t

unbox: Box t -> t
unbox (mkBox b) = b

{- [not needed]
eql_box: (eq a) => Box a -> Box a -> bool
eql_box (mkBox v1) (mkBox v2) = eql (v1) (v2)
-}

{-instance of type eq
put (eq a) => to put constraint on what is inside the Box
type of v1 and v2 is a
check box is equal by checking that contents in box is equal-}
instance (eq a) => eq (Box a) where
  eql (mkBox v1) (mkBox v2) = eql (v1) (v2)

instance (Serialize a) => Serialize (Box a) where
  toString (mkBox b) = "(" ++ (toString b) ++ ", )"
