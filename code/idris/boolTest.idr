module boolTest

import bool

-- test cases for new bool
uf: bool -> bool
uf = (and true)

-- test cases for and
and_t_t: bool
and_t_t = and true true
-- expect true

and_t_f: bool
and_t_f = and true false
-- expect false

and_f_t: bool
and_f_t = and false true
-- expect false

and_f_f: bool
and_f_f = and false false
-- expect false

-- test cases for or
or_t_t: bool
or_t_t = or true true
-- expect true

or_t_f: bool
or_t_f = or true false
-- expect true

or_f_f: bool
or_f_f = or false false
-- expect false

-- test cases for xor
xor_t_t: bool
xor_t_t = xor true true
-- expect false

xor_t_f: bool
xor_t_f = xor true false
-- expect true

xor_f_f: bool
xor_f_f = xor false false
-- expect false

-- test cases for nand
nand_t_t: bool
nand_t_t = nand true true
-- expect false

nand_t_f: bool
nand_t_f = nand true false
-- expect true

nand_f_f: bool
nand_f_f = nand false false
-- expect true

{- Exam 1 Question 5

-- test cases for pand
pand_t_t: bool
pand_t_t = pand true true
-- expect true

pand_t_f: bool
pand_t_f = pand true false
-- expect false

pand_f_t: bool
pand_f_t = pand false true
-- expect false

pand_f_f: bool
pand_f_f = pand false false
-- expect false

-- test cases for por
por_t_t: bool
por_t_t = por true true
-- expect true

por_t_f: bool
por_t_f = por true false
-- expect true

por_f_t: bool
por_f_t = por false true
-- expect true

por_f_f: bool
por_f_f = por false false
-- expect false

-- test cases for pxor
pxor_t_t: bool
pxor_t_t = pxor true true
-- expect false

pxor_t_f: bool
pxor_t_f = pxor true false
-- expect true

pxor_f_t: bool
pxor_f_t = pxor false true
-- expect true

pxor_f_f: bool
pxor_f_f = pxor false false
-- expect false

-- test cases pnand
pnand_t_t: bool
pnand_t_t = pnand true true
-- expect false

pnand_t_f: bool
pnand_t_f = pnand true false
-- expect true

pnand_f_t: bool
pnand_f_t = pnand false true
-- expect true

pnand_f_f: bool
pnand_f_f = pnand false false
-- expect true

-- test cases for andp
||| test case expect true
t1: bool
t1 = andp (mkPair true true)

||| test case expect false
t2: bool
t2 = andp (mkPair true false)

-- test cases for orp
||| test case expect false
t3: bool
t3 = orp (mkPair false false)

||| test case expect true
t4: bool
t4 = orp (mkPair true false)

-- test cases for nandp
||| test case expect false
t5: bool
t5 = nandp (mkPair true true)

||| test case expect true
t6: bool
t6 = nandp (mkPair false true)

-- test cases for xorp
||| test case expect true
t7: bool
t7 = xorp (mkPair false true)

||| test case expect false
t8: bool
t8 = xorp (mkPair false false)

||| test case expect true
t9: bool
t9 = xorp (mkPair true false)

||| test case expect false
t10: bool
t10 = xorp (mkPair true true) -}
