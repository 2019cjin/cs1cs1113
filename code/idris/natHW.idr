module natHW

import bool
import pair 

-- NOTE: Original post edited to remove %default total. You *will* get warnings about totality. Proceed anyway.

{- We now introduce a type to represent the natural numbers using
Peano arithmetic.

In this arithmetic, there are two especially important rules
- zero is a natural number
- the successor of any natural number is a natural number

From this pair of rules arises an infinity of natural numbers. Zero is
a natural number, and the successor of any natural number is a natural
number, so the successor of zero is a natural number; and now, because
the successor of zero is a natural number, its successor, i.e., the
successor of (the successor of zero) is one too; ad infinitum! 

HOMEWORK #1: Learn this way of thinking by rehearsing it mentally
until you've really got it. Work with friends. Explain it to each
other. Test each other. -}

{- We capture this idea with the following deceptively simple data
type definition. What it says is that nat is a type, and there are two
ways to construct a nat. One is to use the constructor, O. The other
is to apply the constructor S to a value that is already known to be
of type nat.  Because O is already known to be of type nat, you can
thus apply S to O (yielding the term (S O)) and the result is also of
type nat. And now because it is a value of type nat, you can apply S
to it to get another value of type nat. Ad infinitum. 

HOMEWORK #2: Study and think about this example as many times as
necessary to get it. Work with friends. Teach each other. Test each
other.  -}

-- Here's our data type definition.

||| A data type to represent the natural numbers.  We use a lower case
||| "n" in the name to distinguish our nat type from Idris's Nat type
data nat = O | S nat

-- HOMEWORK #3: In the REPL ask what are the types of nat, O and S.
-- Be sure you understand the answers! Teach, learning from and test
-- friends.

{-
Here are some examples of some objects (named values) of type nat.
-}

-- zero
z: nat
z = O

-- one
o: nat
o = S O

-- two 
t: nat
t = S (S O)

-- three
r: nat
r = S t

-- HOMEWORK #5: Make up some examples of your own. Add them below this
-- comment.

--four
f: nat 
f = (S (S (S (S O))))

--six
s: nat
s = S (S f)

-- HOMEWORK #6: In the REPL, evaluate the types and values of z, o, t
-- and r, as well as your own values. (E.g., ":t o" will report the
-- type of o, and "o" will report its value (along with its type). Be
-- sure you understand the answers. In particular be sure you
-- understand how the variable expression, "r" is evaluated! Yup: r is
-- unfolded to S t; t is unfolded to S (S O); so the whole expression 
-- unfolds to S (S (S O)). Be able to explain this evaluation process
-- verbally and in writing. Teach and test each other.

{-
The rest of this file contains functions operating on nats.
-}

||| returns true if the argument is (represents) zero, otherwise false
isZero: nat -> bool
isZero O = true
isZero _ = false

-- HOMEWORK #7 Bind x to the result of applying isZero to r. Add your
-- code below this comment.

x: bool
x = isZero r

||| returns the successor of any given nat
succ: nat -> nat
succ n = S n

-- HOMEWORK #8 Bind y to the result of applying succ to O. Add code here.

y: nat
y = succ O

||| returns the predecessor of any given nat
pred: nat -> nat
pred O = O
pred (S n) = n

{- Next we define a function that when given a natural number returns
true if it's even and false otherwise. It is very, very important to
understand this example, your first example of a recursive function -}

||| return true if the argument is even otherwise false
evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n

-- HOMEWORK #9 Bind a, b, c, d, e respectively to the results of
-- applying evenb to O, (S O), (S (S O)) r, and (S r),
-- respectively. Add your code here.

a: bool
a = evenb O

b: bool
b = evenb (S O)

c: bool
c = evenb (S (S O))

d: bool
d = evenb r

e: bool
e = evenb (S r)

