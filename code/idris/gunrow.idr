module gunrow

import list

data country = Argentina | Austrailia | Austria | Honduras | USA

||| A record of this type represents a country and the death rate per
||| 10,000,000 by guns for homocides, suicides, unintentional, other

data gunrow = mkGunrow country Nat Nat Nat Nat

-- value of data type gunrow
argen: gunrow
argen = mkGunrow Argentina 190 279 64 362

austra: gunrow
austra = mkGunrow Austrailia 11 62 5 8

austr: gunrow
austr = mkGunrow Austria 18 268 1 8

hondu: gunrow
hondu = mkGunrow Honduras 648 0 0 0

usa: gunrow
usa = mkGunrow USA 355 670 16 9

-- functions
countryField: gunrow -> country
countryField (mkGunrow c h s u o) = c

homocidePer10M: gunrow -> Nat
homocidePer10M (mkGunrow c h s u o) = h

suicidePer10M: gunrow -> Nat
suicidePer10M (mkGunrow c h s u o) = s

unintentionalPer10M: gunrow -> Nat
unintentionalPer10M (mkGunrow c h s u o) = u

otherPer10M: gunrow -> Nat
otherPer10M (mkGunrow c h s u o) = o

-- data type list gunrow
gunlist: list gunrow
gunlist = cons argen (cons austra (cons austr (cons hondu (cons usa nil))))
