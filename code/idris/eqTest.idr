module eqTest

import bool
import eq
import nat
import unit

b: bool
b = (eql true true)
-- true

n: bool
n = eql O O
-- true

u: bool
u = eql mkUnit mkUnit
