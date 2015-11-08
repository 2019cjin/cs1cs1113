module listTest

import list
import bool
import nat
import President
import PresidentTest
import serialize

-- test cases for toTSring
ts1: list bool
ts1 = true :: false :: true :: true :: false :: nil

ts: String
ts = toString ts1
-- expect "[True, False, True, True]"

-- test cases for filter and map

m1: list bool
m1 = map evenb (O::(S O)::(S (S O))::(S (S (S (S O))))::nil)

f1: list nat
f1 = filter evenb (O::(S O)::(S (S O))::(S (S (S (S O))))::nil)

-- test cases for map
presNames: list String
presNames = map name republicans

presAges: list Nat
presAges = map age democrats

presDemocrat: list bool
presDemocrat = map democrat before2000

-- list value example
li: list bool
li = true :: false :: true :: true :: nil

-- test cases for length

listl1: list Nat
listl1 = nil

||| expect O
l1: nat
l1 = length listl1

listl2: list bool
listl2 = nil

||| expect O
l2: nat
l2 = length listl2

||| expect O
l3: nat
l3 = length nil {a = bool}

||| expect S (S (S O))
l4: nat
l4 = length (3 :: 2:: 1 :: nil)

||| expect S (S (S O))
l5: nat
l5 = length (true :: false :: true :: nil)

-- test cases for append

||| expect true :: false :: nil
a1: list bool
a1 = nil ++ (true :: false :: nil)

||| expect false :: true :: false :: true :: false :: nil
a2: list bool
a2 = (false :: true :: false :: nil) ++ (a1)

||| expect 1 :: nil
a3: list Nat
a3 = nil ++ (1 :: nil)

||| expect 3 :: 2 :: 1 :: nil
a4: list Nat
a4 = (3 :: 2 :: nil) ++ (a3)

||| expect nil
a5: list bool
a5 = nil ++ nil {a = bool}
