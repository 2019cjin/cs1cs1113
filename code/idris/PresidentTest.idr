module PresidentTest

import President
import list
import bool
import relation
import pair

-- relation tests at the end

-- President values
obama: President
obama = MkPresident "B. Obama " 47 true

bush2: President
bush2 = MkPresident "G. W. Bush " 54 false

clinton: President
clinton = MkPresident "B. Clinton " 46 true

bush1: President
bush1 = MkPresident "G. H. W. Bush " 64 false

reagan: President
reagan = MkPresident "R. Regan " 69 false

carter: President
carter = MkPresident "J. Carter " 52 true

ford: President
ford = MkPresident "G. Ford " 61 false

-- list President values
democrats: list President
democrats = carter :: clinton :: obama :: nil

republicans: list President
republicans = ford :: reagan :: bush1 :: bush2 :: nil

before2000: list President
before2000 = ford :: carter :: reagan :: bush1 :: nil

after2000: list President
after2000 = clinton :: bush2 :: obama :: nil

presidents: list President
presidents = obama :: bush2 :: clinton :: bush1 :: reagan :: carter :: ford :: nil

-- test cases for query using a list of records of type President
-- (see PresidentTest.idr)
presAges: Nat
presAges = query plus 0 age democrat presidents
-- expect 145

presNames: String
presNames = query (++) "" name democrat presidents
-- expect "B. Obama B. Clinton J. Carter "

-- test cases for query2 using a list of records of type President
-- (see PresidentTest.idr)
presDemocratAges: Nat
presDemocratAges = query2 presidents democrat age plus 0
-- expect 145

presDemocratNames: String
presDemocratNames = query2 presidents democrat name (++) ""
-- expect "B. Obama B. Clinton J. Carter "

-- test cases for count_rel using a list of records of type President
countDemocratPres: Nat
countDemocratPres = count_rel presidents democrat
-- expect 3

-- test cases for sum_rel using a list of records of type President
totalPresAges: Nat
totalPresAges = sum_rel presidents democrat age
-- expect 145

-- test case for ave_rel using a list of records of type President
avePresAge: pair Nat Nat
avePresAge = ave_rel presidents democrat age
-- expect mkPair 145 3

-- test case for averagePresidentAge which uses ave_rel
averageAge: pair Nat Nat
averageAge = averagePresidentAge presidents democrat
-- expect mkPair 145 3
