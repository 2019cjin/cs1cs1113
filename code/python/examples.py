
# Asignment commands examples

#{}
x = 5

# {(x, 5)}

y = 6

# {(x, 5), (y, 6)}

# conditions
'''
True is literal boolean expression.
indent sequences of commands for true branch. (same for false branch)

'''

if (True):
    x = 0
    z = 10
else:
    x = 1
    z = 11

# go through true branch
# {(x, 0), (y, 6), (z, 10)}

print (x)
print (z)

if (x > 0 or y == x):
    x = 0
else:
    x = 1
    z = 11


print (x)
print (y)
print (z)
# evaluate conditional expression
'''
first evaluate expression x > 0
- look at function application expression
- evaluate variable application expression
---look at the state and see that x = 0
---reduces to 0
- 0 > 0
---return false

see if y equals x
- can't use = (assignment)
- use ==
---like eql
'''

# iteration

'''
every command in program runs in context of current state.

for iteration,
first establish state for iteration to run.
'''

times = 10
while (times > 0):
    print("Hello")
    times = (times - 1)

# evaluate expression on right in current environment.
# then store into times
# recursing down
# prints ten times (off by one)

# procedure call and procedures

# def function_name(args list)
def fun(a, b, c, x):
    result = a * (x * x) + b * x + c
    return result

a = fun (1, 2, 3, 4)
print ("a =")
print (a)
