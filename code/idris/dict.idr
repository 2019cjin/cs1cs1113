module dict

import set_adt
import ite
import pair
import option
-- import set
import eq
import serialize

{-
dictionary rep. finite of partial function from value key type ->
value of type because does cover all key types.
-}

-- specification
{- dict. abt provides dict. type, an empty dictionary, functions to
map a key to a value (lookup function), derive dictionary from an
existing one by tuple override (throws out old tuple and replace with
new variable), derive a new dict. from an existing one by remove a
tuple from a dict.,
-}

||| Dict data type; abstract (without implementation details)
data dict: (k: Type) -> (v: Type) -> Type

||| An empty dictionary, constant as a starging point for building nontrivial
||| dictionaries.
emptyDict: dict k v

||| derive a new dictionary by removing any pair matching a key
dict_remove: (eq k) => k -> dict k v -> dict k v

||| function derivew new dict. by tuple override. Inserts a new pair into dict, first remove any pair in the dict. with a matching key.
dict_override: (eq k, eq (pair k v)) => k -> v -> dict k v -> dict k v

||| takes key and returns value associated with v if key k exists
dict_lookup: (eq k) => k -> dict k v -> option v


-- dict rep partial function
-- equality comparison for dict
dict_eql (eq k, eq v) => (dict k v) -> (dict k v) -> bool

instance (eq k, eq v) => eq (dict k v) where
  eql d1 d2 = dict_eql d1 d2

||| serialization for dict
dict_toString: (Serialize k, Serialize v) => dict (k v) -> String

instance (Serialize k, Serialize v) => Serialize (dict k v) where
  toString d = dict_toString d

-- implementation

|||We rep dict as a set of "key-value" pairs w/ the invariant that at most
|||one pair can have a given key

 dict k v = mkDict (set (pair k v))

emptyDict = mkDict (emptySet)
-- emptyDict rep by empty dictionary

matchKey: (eq k) => k -> pair k v -> bool
matchKey k (mkPair k1 v1) = eql k k1

noMatchKey: (eq k) => k -> pair k v -> bool
notMatchkey k p = not (matchKey k p)

dict_remove k (mkDict s) = mkDict (set_filter (notMatchKey k) s)


dict_override k1 v1 (mkDict s) = set_insert ((mkPair k1 v1) s) (dict_remove k1 (mkDict s))

{-
if import is k1 v1 (mkDict s) - use idea of dict_remove

keytovalue k -> pair k v -> option v
1. check of
-}
