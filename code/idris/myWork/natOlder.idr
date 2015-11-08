module nat

import bool

%default total

data nat = O | S nat

||| returns true if the argument is (represents) zero, otherwise false
isZero: nat -> bool
isZero O = true
isZero (S _) = false

||| retunrs the successor of any given nat (use nat.succ since succ already built in)
succ: nat -> nat
succ O = (S O)
succ n = S n

||| returns the predecessor of any given nat 
pred: nat -> nat
pred O = O
pred (S n) = n

||| return true if argument is even otherwise false
evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n
