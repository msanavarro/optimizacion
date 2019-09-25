'''
Created on 24 sep. 2019

@author: msanavarro
'''

import numpy as np

def hard_svm(X, y):
    '''
    (X,y): Datos de entrenamiento [X.shape=(m,p), y.shape=(m,)]
    X,y matrices de numpy
    (w,b):  Hiperplano [w.shape=(p,), b.shape=(1,)]
    '''
    w = 1
    b = 1
    
    
    
    
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
