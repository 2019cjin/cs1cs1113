module set_adt_test

import set_adt
import bool
import option
import pair
import list
import nat
import eq
import serialize

-- testing data type set

set1: set nat
set1 = emptySet
-- expect mkSet nil

set2: set nat
set2 = mkSet ((S (S (S O))) :: (S (S O)) :: (S O) :: O ::  nil)
-- expect mkSet ((S (S (S O))) :: (S (S O)) :: (S O) :: O :: nil)

set3: set nat
set3 = mkSet ((S O) :: (S (S (S O))) :: nil)
-- expect mkSet ((S O) :: (S (S (S O))) :: nil)

set4: set bool
set4 = mkSet (true :: false :: nil)
-- expect mkSet (true :: false :: nil)

set5: set nat
set5 = mkSet (O :: (S (S O)) :: nil)

set6: set nat
set6 = mkSet (O :: (S O) :: nil)

set7: set nat
set7 = mkSet (O :: (S O) :: (S (S O)) :: nil)

set8: set nat
set8 = mkSet ((S (S O)) :: O :: (S O) :: nil)

-- testing isEmpty

empty1: bool
empty1 = isEmpty set1
-- expect true

empty2: bool
empty2 = isEmpty set2
-- expect false

-- test cases for set_insert

insert1: set nat
insert1 = set_insert (S O) set1
-- expect mkSet ((S O) :: nil)

insert2: set bool
insert2 = set_insert true set4
-- expect mkSet (true :: false :: nil)

insert3: set nat
insert3 = set_insert (S (S O)) set3
-- expect mkSet ((S (S O)) :: (S O) :: (S (S (S O))) :: nil)

-- test cases for set_remove

remove1: set nat
remove1 = set_remove O emptySet
-- expect mkSet nil

remove2: set nat
remove2 = set_remove O set3
-- expect mkSet ((S O) :: (S (S (S O))) :: nil)

remove3: set nat
remove3 = set_remove (S O) set2
-- expect mkSet ((S (S (S O))) :: (S (S O)) :: O :: nil)

-- test cases for set_cardinality

cardinality1: nat
cardinality1 = set_cardinality set1
-- expect O

cardinality2: nat
cardinality2 = set_cardinality set2
-- expect (S (S (S (S O))))

cardinality3: nat
cardinality3 = set_cardinality set4
-- expect (S (S O))

-- test cases for set_member

member1: bool
member1 = set_member O set1
-- expect false

member2: bool
member2 = set_member true set4
-- expect true

member3: bool
member3 = set_member O set3
-- expect false

-- test cases for set_union

union1: set nat
union1 = set_union set1 set2
-- expect mkSet ((S (S (S O))) :: (S (S O)) :: (S O) :: O :: nil)

union2: set nat
union2 = set_union set2 set1
-- expect mkSet (O :: (S O) :: (S (S O)) :: (S (S (S O))) :: nil)

union3: set nat
union3 = set_union set2 set3
-- expect mkSet (O :: (S (S O)) :: (S O) :: (S (S (S O))) :: nil)

union4: set nat
union4 = set_union set3 set5
-- expect mkSet ((S (S (S O))) :: (S O) :: O :: (S (S O)) :: nil)

-- test cases for set_intersection

intersect1: set nat
intersect1 = set_intersection set1 set3
-- expect mkSet nil

intersect2: set nat
intersect2 = set_intersection set3 set1
-- expect mkSet nil

intersect3: set nat
intersect3 = set_intersection set2 set3
-- expect mkSet ((S (S (S O))) :: (S O) :: nil)

intersect4: set nat
intersect4 = set_intersection set3 set5
-- expect mkSet nil

intersect5: set nat
intersect5 = set_intersection set3 set6
-- expect mkSet ((S O) :: nil)

-- test cases for set_difference

diff1: set nat
diff1 = set_difference set1 set3
-- expect mkSet nil

diff2: set nat
diff2 = set_difference set3 set1
-- expect mkSet ((S O) :: (S (S (S O))) :: nil)

diff3: set nat
diff3 = set_difference set3 set5
-- expect mkSet ((S O) :: (S (S (S O))) :: nil)

diff4: set nat
diff4 = set_difference set2 set3
-- expect mkSet ((S (S O)) :: O :: nil)

diff5: set nat
diff5 = set_difference set3 set6
-- expect mkSet ((S (S (S O))) :: nil)

-- test cases for set_forall
forall1: bool
forall1 = set_forall (evenb) (set1)
-- expect true

forall2: bool
forall2 = set_forall (evenb) (set2)
-- expect false

forall3: bool
forall3 = set_forall (evenb) (set3)
-- expect false

forall4: bool
forall4 = set_forall (oddb) (set3)
-- expect true

-- test cases for set_exists
exist1: bool
exist1 = set_exists evenb set1
-- expect false

exist2: bool
exist2 = set_exists evenb set2
-- expect true

exist3: bool
exist3 = set_exists evenb set3
-- expect false

exist4: bool
exist4 = set_exists oddb set3
-- expect true

-- test cases for set_witness
witness1: option nat
witness1 = set_witness evenb set1
-- expect none

witness2: option nat
witness2 = set_witness evenb set2
-- expect some (S (S O))

witness3: option nat
witness3 = set_witness evenb set3
-- expect none

witness4: option nat
witness4 = set_witness oddb set3
-- expect some (S O)

-- test cases for set_product
product1: set (pair nat nat)
product1 = set_product set1 set1
-- expect mkSet nil

product2: set (pair nat bool)
product2 = set_product set3 set4
-- expect mkSet ((mkPair (S O) true) ::
--               (mkPair (S O) false) ::
--               (mkPair (S (S (S O))) true) ::
--               (mkPair (S (S (S O))) false) :: nil)

product3: set (pair bool nat)
product3 = set_product set4 set7
-- expect mkSet ((mkPair true O) ::
--               (mkPair true (S O)) ::
--               (mkPair true (S (S O))) ::
--               (mkPair false O) ::
--               (mkPair false (S O)) ::
--               (mkPair false (S (S O))) :: nil)

-- test cases for eq instance of type set nat
set_eq1: bool
set_eq1 = eql (set1) (set1)
-- expect true

set_eq2: bool
set_eq2 = eql (set1) (set2)
-- expect false

set_eq3: bool
set_eq3 = eql (set2) (set3)
-- expect false

set_eq4: bool
set_eq4 = eql (set7) (set8)
-- expect true

-- test cases for Serialize instance of type set nat and of type set bool
string1: String
string1 = toString (set1)
-- expect "{}"

string2: String
string2 = toString (set2)
-- expect "{||| Z, || Z, | Z, Z}"

string3: String
string3 = toString (set4)
-- expect "{True, False}"
