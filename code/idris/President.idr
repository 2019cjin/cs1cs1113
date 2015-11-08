module President

import bool
import relation
import list
import pair

||| A record type that is equivalent to
||| (data President = mkPerson String Nat bool).
||| A president has a name of a president, an age (in years) of the president at
||| inaguration, and a bool that tells the user whether or not the president is
||| a Democrat.

record President where
    constructor MkPresident
    name : String
    age : Nat
    democrat: bool

averagePresidentAge: list President -> (President -> bool) -> pair Nat Nat
averagePresidentAge l b = ave_rel l b age
