'''
Created on 24 sep. 2019

@author: msanavarro
'''

import numpy as np
from cvxopt import solvers, matrix
from matplotlib import pyplot

def hard_svm(X, y):
    """
    Devuelve los parámetros (w, b) del hiperplano que separa a los puntos con etiqueta
    1 de aquellos con etiqueta -1
    
    Requiere 
    ----------
    numpy, cvxopt

    Parametros
    ----------
    X : numpy.array
        Matriz de tamaño [m, k]
    y : numpy.array
        Vector de tamaño m con etiquetas 1, -1

    Returns
    -------
    numpy.array
        Parámetros (w, b) del hiperplano w'x + b = 0

    """
    P = matrix(np.concatenate((np.concatenate((np.identity(X.shape[1], float), np.zeros((X.shape[1],1),float)), axis=1), np.zeros((1,(X.shape[1]+1)),float)), axis=0), tc='d')
    q = matrix(np.zeros((X.shape[1]+1,1),float), tc='d')
    y.shape = (X.shape[0],1)
    X = np.concatenate((X, np.ones((X.shape[0],1))), axis=1)
    G = -y * X
    G = matrix(G, tc='d')
    h = matrix(-np.ones(X.shape[0]), tc='d')
        
    sol = solvers.qp(P,q,G,h)
    print(sol['x'])
    w = np.array(sol['x'])
    w, b = w[0:-1,:], w[-1,:]

    return w, b

def datos(N):
    np.random.seed(1111)
    n = int(N/2)
    cov = [[1, 0], [0, 1]]
    X1 = np.random.multivariate_normal([-9,10], cov, n)
    X2 = np.random.multivariate_normal([7,-8], cov, n)
    X = np.concatenate((X1, X2), axis=0)
    y = np.concatenate((np.ones(n), -1*np.ones(n)), axis=0)
    return X, y.squeeze()


X, y = datos(200)

(w,b) = hard_svm(X, y)
print(w, b)
pyplot.scatter(X[:,0], X[:,1])
pyplot.plot([np.min(X[:,0]),np.max(X[:,0])],[(-b-w[0]*np.min(X[:,0]))/w[1],(-b-w[0]*np.max(X[:,0]))/w[1]],c='g')
pyplot.show()


