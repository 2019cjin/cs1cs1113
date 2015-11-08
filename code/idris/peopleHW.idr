module people

data people = mary | maurice

lovedBy: people -> people
lovedBy _ = maurice
