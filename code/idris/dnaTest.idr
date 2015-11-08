module dnaTest

import dna
import list
import pair
import nat

-- test cases countBase
cb: nat
cb = countBase (G :: A :: T :: A :: C :: A :: nil) A
-- expect S (S (S O))

-- test cases for complete
co1: list (pair base base)
co1 = complete (A :: T :: G :: nil)
-- expect (mkPair A T) :: (mkPair T A) :: (mkPair G C) :: nil

-- test cases for strand2
s2: list base
s2 = strand2 ((mkPair A T) :: (mkPair T A) :: (mkPair G C) :: nil)
-- expect (T :: A :: C :: nil)

-- test cases for strand1
s1: list base
s1 = strand1 ((mkPair A T) :: (mkPair T A) :: (mkPair G C) :: nil)
-- expect (A :: T :: G :: nil)

-- test cases for complement_strand
s: (list base)
s = complement_strand (A :: T :: G :: nil)
-- expect (T :: A :: C :: nil)

-- test cases for complement_base

a: base
a = complement_base A
-- expect T

t: base
t = complement_base T
-- expect a

g: base
g = complement_base G
-- expect C

c: base
c = complement_base C
-- expect G
