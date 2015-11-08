module gender

import bool

data gender = male | female

isMale: gender -> bool
isMale male = true
isMale _ = false

isFemale: gender -> bool
isFemale female = true
isFemale _ = false
