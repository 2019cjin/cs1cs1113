module nat

import bool
import pair
import eq
import serialize

-- data type definition
||| A data type to represent the natural numbers.  We use a lower case
||| "n" in the name to distinguish our nat type from Idris's Nat type
data nat = O | S nat

||| returns true if the argument is (represents) zero, otherwise false
isZero: nat -> bool
isZero O = true
isZero _ = false

||| returns the successor of any given nat
succ: nat -> nat
succ n = S n

||| returns the predecessor of any given nat
pred: nat -> nat
pred O = O
pred (S n) = n

||| return true if the argument is even otherwise false
evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n

||| return false if the argument is even otherwise false
oddb: nat -> bool
oddb n = not (evenb n)

-- binary function for addition
add: nat -> nat -> nat
add O m = m
add (S n) m = S (add n m)

-- binary function for multiplication
mult: nat -> nat -> nat
mult O m = O
mult (S n) m = add m (mult n m)

||| given a natural number, return the factorial of that number
fact: nat -> nat
fact O = (S O)
fact (S n) = mult (S n) (fact n)

-- binary function for subtraction
sub: nat -> nat -> nat
sub O m = O
sub m O = m
sub (S n) (S m) = sub n m

-- binary function for exponents
exp: nat -> nat -> nat
exp O m = O
exp (S n) O = S O
exp m (S n) = mult m (exp m n)

-- binary function for less than or equal to
le: nat -> nat -> bool
le O m = true
le (S n) O = false
le (S n) (S x) = le n x

-- binary function for equal to
eql_nat: nat -> nat -> bool
eql_nat O O = true
eql_nat (S n) O = false
eql_nat O (S n) = false
eql_nat (S n) (S m) = eql_nat n m

-- binary function for greater than
gt: nat -> nat -> bool
gt a b = not (le a b)

-- binary function for greater than or equal to
ge: nat -> nat -> bool
ge a b = xor (gt a b) (eql_nat a b)

-- binary function for less than
lt: nat -> nat -> bool
lt a b = not (ge a b)

-- fibonacci
fib: nat -> nat
fib O = O
fib (S O) = (S O)
fib (S (S n)) = add (fib n) (fib(S n))

instance eq nat where
  eql n1 n2 = eql_nat n1 n2

instance Serialize nat where
  toString O = "Z"
  toString (S n) = "|" ++ (toString n)
