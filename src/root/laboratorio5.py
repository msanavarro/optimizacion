'''
Created on 15 oct. 2019

@author: msanavarro
'''

import numpy as np
from cvxopt import solvers, matrix
from matplotlib import pyplot
import cvxopt

m = 100
n = 100
c = matrix(np.ones((m, 1)), tc='d')
G = matrix(np.zeros((m, n)), tc='d')
h = matrix(np.zeros(m), tc='d')
A = matrix(np.random.randint(5, size=(m,n)), tc='d')
b = matrix(np.random.randint(10, size=(m,1)), tc='d')

sol = solvers.lp(c,G,h,A,b)

print(sol['x'])