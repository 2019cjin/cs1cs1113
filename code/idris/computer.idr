module computer

data computer = mac | pc
data user = engineer | humanities

showUser: computer -> user
showUser mac = humanities
showUser pc = engineer
