module bool

data bool = true | false

id: bool -> bool
id true = true
id false = false

not: bool -> bool
not true = false
not false = true

constTrue: bool -> bool
constTrue true = true
constTrue false = true

constFalse: bool -> bool
constFalse true = false
constFalse false = false
