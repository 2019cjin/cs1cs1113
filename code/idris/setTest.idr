module setTest

import set
import list
import eq
import nat
import bool

s0: set nat
s0 = new_set

s1: set nat
s1 = set_insert (S O) s0

s2: set nat
s2 = set_insert (S O) s1

b0: set bool
b0 = new_set

b1: set bool
b1 = set_insert true b0

b2: set bool
b2 = set_insert true b1

b3: set bool
b3 = set_insert false b2

-- sets used to test eq instance of type set nat

t1: set nat
t1 = mkSet ((S O) :: (S (S O)) :: O :: nil)

t2: set nat
t2 = mkSet (O :: (S O) ::(S (S O)) :: nil)

t3: set nat
t3 = mkSet ((S O) :: nil)

-- test eql

bool1: bool
bool1 = eql t1 t2
-- expect true

bool2: bool
bool2 = eql t1 t3
-- expect false

bool3: bool
bool3 = eql t3 t1
-- expect false
