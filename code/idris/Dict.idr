module Dict

import set_adt
import list
import ite
import pair
import option
import eq
import serialize
import bool

data Dict: (k: Type) -> (v: Type) -> Type
data Dict k v = mkDict (set (pair k v))

emptyDict: Dict k v
emptyDict = mkDict (emptySet)

matchKey: (eq k) => k -> pair k v -> bool
matchKey k (mkPair k1 v1) = eql k k1

noMatchKey: (eq k) => k -> pair k v -> bool
noMatchKey k p = not (matchKey k p)

dict_set_remove: (eq k) => k -> set (pair k v) -> set (pair k v)
dict_set_remove k (mkSet l) = mkSet (list.filter (noMatchKey k) l)

dict_remove: (eq k) => k -> Dict k v -> Dict k v
dict_remove k (mkDict s) = mkDict (dict_set_remove k s)

dict_override: (eq k, eq (pair k v)) => k -> v -> Dict k v -> Dict k v
dict_override k1 v1 (mkDict s) = mkDict (set_insert (mkPair k1 v1) (dict_set_remove k1 s))

dict_lookup: (eq k) => k -> Dict k v -> option v
dict_lookup k emptyDict = none
dict_lookup k (mkDict (mkSet (h :: t))) = ite (matchKey k h)
                                              (some (snd h))
                                              (dict_lookup k (mkDict (mkSet (t))))

dict_eql: (eq k, eq v) => (Dict k v) -> (Dict k v) -> bool
dict_eql (mkDict s1) (mkDict s2) = eql s1 s2

instance (eq k, eq v) => eq (Dict k v) where
  eql d1 d2 = dict_eql d1 d2
{-

dict_pair_toString: (Serialize k, Serialize v) => (pair k v) -String
dict_pair_toString (mkPair k v) = "(" ++ (toString k) ++ " ," ++ (toString v) ++ ")"

dict_toString: (Serialize k, Serialize v) => (Dict k v) -> String
-}
 
