module relationTest

import people
import bool
import list
import relation
import pair

-- list of records of type people used to test function in relation
a: people
a = mkPeople "Ann " 47 true 63

b: people
b = mkPeople "Bob " 35 false 70

c: people
c = mkPeople "Claire " 32 true 67

d: people
d = mkPeople "Dan " 28 false 72

e: people
e = mkPeople "Edith " 18 true 59

p: list people
p = a :: b :: c :: d :: e :: nil

-- test cases from lecture notes that uses query
years': Nat
years' = query plus 0 age gender p
-- expect 97

totalHeight: Nat
totalHeight = query plus 0 height gender p
-- expect 189

names: String
names = query (++) "" name gender p
-- expect "Ann Claire Edith "

-- test cases from lecture notes that uses query2
years'': Nat
years'' = query2 p gender age plus 0
-- expect 97

totalInches'': Nat
totalInches'' = query2 p gender height mult 1
-- expect 189

names'': String
names'' = query2 p gender name (++) ""
-- expect "Ann Claire Edith "

-- use of query to count humber of elements in list (in lecture notes)
number: Nat
number = query2 p gender countOne plus 0
-- expect 3

-- test case for count_rel
count: Nat
count = count_rel p gender
-- expect 3

-- test case for sum_rel
sumAge: Nat
sumAge = sum_rel p gender age
-- expect 97

sumHeights: Nat
sumHeights = sum_rel p gender height
-- expect 189

-- test case for avg_rel
avgAge: pair Nat Nat
avgAge = ave_rel p gender age
-- expect mkPair 97 3

avgHeight: pair Nat Nat
avgHeight = ave_rel p gender height
-- expect 189 3
