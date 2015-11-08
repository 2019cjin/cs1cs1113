''' key differences:
1. idris is compiled language; python is interpreted (by default)
2. idris uses static type checking; python uses dynamic type checking
    - static - check when compiler checks/translates code
        - (ibc file generated)
    - dynamic - check when running (run time)
        - python interpreter reads code and runs code
3. idris values are immutable, python has mutable state
    - idris - bound variable to value, can't change that
    - python - (e.g.) x = 5 here, then x = 6 there
        - can update variables
    - diff.
4. idris is a language of expression, python languge of commands
    - python
        - command - state transformer
            - state - state of computation at point in time
                - e.g. x = 3 here, then x = 4 there
            - command changes state of a system
            - assignment, ite, while-loop,
              composition of commands (e.g. big command w/many small commands)

python
- no complie stage (static/dynamic differences gone)

why uses static type checking

idris- every value has static type.
- types know and checked at complie time
- can't complie program with type error
- no need to check for dynamic type errors

python - every value has 2 types (static and dynamic)
- static - known at compiler
    - object
- dynamic - known as run time
    - get run-time type error
'''

# type checking demo

def foo (n):
    return n + 3
# don't give type of n because python won't find static type error

# print (foo("Hello!"))
# function(tuple)
'''
string bound temp. to n

get run-time error
- could never happen in idris
'''

print(foo(6))

# works

print("Happy B-day Boole!")
'''
Nov. 2, 2015 (Boole's B-day!)
'''

'''
inputs/outputs
- print is infectful command
    - takes input and returns outputs
    - output command

command can
- change state of program
- affects real world
- returns a value
'''

print(print ("Happy B-Day Boole!"))

'''
returns none type
- class NoneType is dynamic type of none
none type similar to unit
'''

# don't need to declare type
# {}
x = 5
#{(x, 5)}
print (x)
# doesn't change state of my program (print)

# {(x, 5)}

x = 6
# {(x, 6)}
# x gets 6, assignment statement, take 6 and put in the box called x
# assignment overwrote previous assignment

print(6)

#{(x, 6)}

y = 7
# {(x , 6), (y = 7)}

print(y)
# {(x , 6), (y = 7)}
print (x)
# {(x , 6), (y = 7)}

'''
imperative programming
- state
- environment/state - pairing variables and values
- have state, initiallize state, commands run, at certain point at in some state
    - prob. not sure how you got to what state
'''

'''
variables can be changed over time

state of computation =
set of values of all variables at a point of computation
'''
