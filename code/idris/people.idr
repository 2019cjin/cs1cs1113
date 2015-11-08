module people

import bool

||| A record type that is equivalent to:
||| (data people = mkPeople String Nat bool Nat)
||| but where we give names to fields.
||| A person has a name, an age in
||| years, a bool to indicate if the person
||| is female (true = female), and a height in
||| inches.

record people where
    constructor mkPeople
    name : String
    age : Nat
    gender : bool
    height : Nat
