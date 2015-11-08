module bit

--Data type
data bit = one | zero

--Functions
change: bit -> bit
change one = zero
change zero = one

id: bit -> bit
id one = one
id zero = zero
