module listTest_nat

import list
import nat

-- Test cases for list

-- test cases for append
append1: list_nat
append1 = append nil (cons (S (S O)) nil)
-- expect cons (S (S O)) nil

append2: list_nat
append2 = append (cons (S O) nil) (cons (S (S O)) nil)
-- expect cons (S O) (cons (S (S O)) nil)

append3: list_nat
append3 = append (append1) (append2)
-- expect cons (S (S O)) (cons (s O) (cons (S (S O)) nil))

-- examples for data type list_nat
l0: list_nat
l0 = nil

l1: list_nat
l1 = cons O nil

l2: list_nat
l2 = (cons (S O) (cons (S(S O)) nil))

l3: list_nat
--l3 = cons (S (S (S O)))(l2)
l3 = cons (S O)(cons (S (S O))(cons (S (S (S O)))(nil)))
