module friend

import bool

||| A friend is someone who is or isn't trustworthy, who has a name, and who
||| has an age in years.

data friend = mkFriend bool String Nat

f1: friend
f1 = mkFriend true "Christine" 20

f2: friend
f2 = mkFriend false "Joe" 38

getTrust: friend -> bool
getTrust (mkFriend b s n) = b

getName: friend -> String
getName (mkFriend b s n) = s

getAge: friend -> Nat
getAge (mkFriend b s n) = n
