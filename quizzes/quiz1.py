'''Plot the function $f(x) = x^2$ for integer values of x
ranging from 0 inclusive to 10 exclusive.'''

import pylab as pl

x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

fx = [0, 1, 4, 9, 16, 25, 36, 49, 56, 81]

pl.plot(x, fx)

pl.show()
