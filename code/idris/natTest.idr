module natTest

import nat
import bool
-- import pair
import serialize

{-
-- test cases for serialize
tos: String
tos = toString S (S (S O)) -}

-- example
pf: nat -> nat
pf = add (S (S O))

-- Test cases for new nat

-- test cases for add
add1: nat
add1 = add O (S O)
-- expect (S O)

add2: nat
add2 = add (S (S (S O))) (S (S O))
-- expect (S (S (S (S (S O)))))

-- test cases for mult
mult1: nat
mult1 = mult O (S (S O))
-- expect O

mult2: nat
mult2 = mult (S (S (S O))) (S (S O))
-- expect (S (S (S (S (S (S O))))))

-- test cases for fact
fact1: nat
fact1 = fact O
-- expect (S O)

fact2: nat
fact2 = fact (S (S (S O)))
-- expect (S (S (S (S (S (S O))))))

-- test cases for sub
sub1: nat
sub1 = sub O (S (S O))
-- expect O

sub2: nat
sub2 = sub (S (S O)) O
-- expect (S (S O))

sub3: nat
sub3 = sub (S (S (S (S (S (S O)))))) (S (S O))
-- expect (S (S (S (S O))))

sub4: nat
sub4 = sub (S (S O)) (S (S (S (S (S O)))))
-- expect O

-- test cases for exp
exp1: nat
exp1 = exp O O
-- expect O

exp2: nat
exp2 = exp O (S (S O))
-- expect O

exp3: nat
exp3 = exp (S (S O)) O
-- expect (S O)

exp4: nat
exp4 = exp (S (S O)) (S (S O))
-- expect (S (S (S (S O))))


-- test cases for le
le1: bool
le1 = le O (S (S O))
-- expect true

le2: bool
le2 = le O O
-- expect true

le3: bool
le3 = le (S (S O)) O
-- expect false

le4: bool
le4 = le (S (S O)) (S (S (S O)))
-- expect true

le5: bool
le5 = le (S (S (S O))) (S O)
-- expect false

-- test cases for eq
eq1: bool
eq1 = eq O O
-- expect true

eq2: bool
eq2 = eq (S (S (S O))) (S (S (S O)))
-- expect true

eq3: bool
eq3 = eq (S (S (S O))) (S O)
-- expect false

eq4: bool
eq4 = eq (S O) (S (S (S O)))
-- expect false

-- test cases for gt
gt1: bool
gt1 = gt (S O) (S O)
-- expect false

gt2: bool
gt2 = gt (S O) (S (S (S O)))
-- expect false

gt3: bool
gt3 = gt (S (S (S O))) (S O)
-- expect true

-- test cases for ge
ge1: bool
ge1 = ge (S (S O)) (S (S O))
-- expect true

ge2: bool
ge2 = ge (S (S (S (S O)))) (S (S O))
-- expect true

ge3: bool
ge3 = ge (S O) (S (S (S O)))
-- expect false

-- test cases for lt
lt1: bool
lt1 = lt (S (S O)) (S (S O))
-- expect false

lt2: bool
lt2 = lt (S( (S (S O)))) (S O)
-- expect false

lt3: bool
lt3 = lt (S O) (S (S (S O)))
-- expect true

-- test cases for fib
fib1: nat
fib1 = fib O
-- expect O

fib2: nat
fib2 = fib (S O)
-- expect (S O)

fib3: nat
fib3 = fib (S (S (S (S (S (S O))))))
-- expect (S (S( (S (S (S (S (S (S O)))))))))

{-  -- Test cases for nat.idr part 3 Homework.

-- Test cases for exp

-- expect O
t1: nat
t1 = exp (mkPair O O)

-- expect O
t2: nat
t2 = exp (mkPair O (S (S O)))

-- expect S O
t3: nat
t3 = exp (mkPair (S (S O)) O)

-- expect (S (S (S (S O))))
t4: nat
t4 = exp (mkPair (S (S O)) (S (S O)))

-- Test cases for lep

-- expect true
t5: bool
t5 = lep (mkPair O (S (S O)))

-- expect true
t6: bool
t6 = lep (mkPair (S (S O)) (S (S O)))

-- expect true
t7: bool
t7 = lep (mkPair (S O) (S (S O)))

-- expect false
t8: bool
t8 = lep (mkPair (S (S O)) (S O))

-- Test cases for eqp

-- expect true
t9: bool
t9 = eqp (mkPair (S O) (S O))

-- expect false
t10: bool
t10 = eqp (mkPair (S O) (S (S O)))

-- Test cases for gtp

-- expect false
t11: bool
t11 = gtp (mkPair (S O) (S (S O)))

-- expect false
t12: bool
t12 = gtp (mkPair (S O) (S O))

-- expect true
t13: bool
t13 = gtp (mkPair (S (S O)) (S O))

-- Test cases for gep

-- expect false
t14: bool
t14 = gep (mkPair (S O) (S (S O)))

-- expect true
t15: bool
t15 = gep (mkPair (S O) (S O))

-- expect true
t16: bool
t16 = gep (mkPair (S (S O)) (S O))

-- Test cases for ltp

-- expect true
t17: bool
t17 = ltp (mkPair (S O) (S (S O)))

-- expect false
t18: bool
t18 = ltp (mkPair (S (S O)) (S (S O)))

-- expect false
t19: bool
t19 = ltp (mkPair (S (S (S O))) (S O))
-- From nat.idr Homework Part 1
-- NOTE: Original post edited to remove %default total. You *will* get warnings about totality. Proceed anyway.

We now introduce a type to represent the natural numbers using
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
other. Test each other.

We capture this idea with the following deceptively simple data
type definition. What it says is that nat is a type, and there are two
ways to construct a nat. One is to use the constructor, O. The other
is to apply the constructor S to a value that is already known to be
of type nat.  Because O is already known to be of type nat, you can
thus apply S to O (yielding the term (S O)) and the result is also of
type nat. And now because it is a value of type nat, you can apply S
to it to get another value of type nat. Ad infinitum.

HOMEWORK #2: Study and think about this example as many times as
necessary to get it. Work with friends. Teach each other. Test each
other.

-- HOMEWORK #3: In the REPL ask what are the types of nat, O and S.
-- Be sure you understand the answers! Teach, learning from and test
-- friends.

Here are some examples of some objects (named values) of type nat.

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

The rest of this file contains functions operating on nats.

-- HOMEWORK #7 Bind x to the result of applying isZero to r. Add your
-- code below this comment.

x: bool
x = isZero r

-- HOMEWORK #8 Bind y to the result of applying succ to O. Add code here.

y: nat
y = succ O

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

--HOMEWORK #10 In English, describe all of the steps involved in
--evaluating the function application expression, evenb (S r). You
--must be able to explain this process to yourself and your friends!
--The idea is that you keep on applying reduction (simplification)
--rules until you get to a value that cannot be reduced further. Write
--your answer by filling in the following block comment.

When Idris evaluates evenb (S r), it goes to the nat.idr module to
look at the evenb definition. When looking at the evenb definition,
idris tries to match evenb (S r) to the patterns listed for the evenb
definition. Idris looks at the patterns one at a time from top to
bottom until it finds a pattern that matches evenb (S r). When
Idris finds a pattern that matches evenb (S r), it then evaluates (S r). When evaluating r, Idris looks in the nat module and sees that r is bound to the value of the  expression (S t). Idris looks for t in the nat module and sees that t is bound to the value S (S O).  Idris plugs S (S O) for t in (S t) to get S (S (S O)). Then Idris plugs S (S (S O)) for r in (S r) to get S (S (S (S O))). Idris plugs S (S (S (S O))) for (S r) into evenb (S r) and returns a value determined by the rule that evenb (S r) matches.


-- HOMEWORK #11 Here's a function that takes a pair of natural numbers
-- (values of type nat) and that returns their sum (as another value
-- of type nat). We give you the function name and type along with the
-- left hand sides of the two rules that you'll need. We've filled in
-- the right hand sides with placeholders. Your task is to replace the
-- right hand sides of the two rules.

-- Here are a few examples of how this function should work, to get
-- you going. We use ==> to mean "reduces to" or "returns"

-- addp (mkPair O O) ==> O
-- addp (mkPair O (S (S O))) ==> S (S O)
-- addp (mkPair (S O) O) ==> S O
-- addp (mkPair (S (S O)) (S (S (S O)))) ==> S (S (S (S (S O))))

-- Completing the first rule should be pretty easy. Just think about
-- the most basic properties of arithmetic. The second rule is more
-- challenging. Go back and study the evenb example. Notice how we
-- used evenb within its own definition! The idea is that we can
-- compute evenb for a big number by returning the result that we get
-- when we apply it to a number that is two less than the number that
-- we started with. You're going to use a similar idea here.

-- This is the hardest but also the most important problem in this
  -- problem set. There is *no grading penalty* for not getting an
  -- answer to this problem. There is no grading reward for getting
  -- it. Really: do *not* collaborate on this problem. It will help
  -- us instructors to see how you do.

  -- HOMEWORK 12 -- Use the REPL to verify that these tests return the
-- expected results

||| a test, expecting O
h1: nat
h1 = addp (mkPair O O)

||| a test, expecting S (S O)
h2: nat
h2 = addp (mkPair O (S (S O)))

||| a test, expecting (S O)
h3: nat
h3 = addp (mkPair (S O) O)

||| a test, expecting (S (S (S (S (S O)))))
h4: nat
h4 = addp (mkPair (S (S O)) (S (S (S O))))

-- nat.idr part 2 test cases

||| test case, expect O
h5: nat
h5 = multp (mkPair O (S (S O)))

||| test case, expect (S (S (S (S O))))
h6: nat
h6 = multp (mkPair (S (S O)) (S (S O)))

||| test case, expect S O
h7: nat
h7 = factp (O)

||| test case, expect (S (S (S (S (S (S O))))))
h8: nat
h8 = factp (S (S (S O)))
-}
