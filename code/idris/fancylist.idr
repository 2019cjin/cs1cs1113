-- created on Oct. 16, 2015

module fancylist

import list
import nat

fancyplus: list nat -> nat
fancyplus nil = O
fancyplus (h :: t) = add h (fancyplus t)

fancymult: list nat -> nat
fancymult nil = S O
fancymult (h :: t) = mult h (fancymult t)

-- binary operator (1st argument)
-- identity elements (2nd arguement)
-- type of list element (3rd arguement)

fancy: (a -> a -> a) -> a -> (list a) -> a
fancy f id nil = id
fancy f id (h :: t) = f h (fancy f id t)
