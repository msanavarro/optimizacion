'''
Created on 8 sep. 2019

@author: msanavarro
'''

'''
El estimador de mínimos cuadrados de b para el problema y=Xb es
b=((X'X)^-1)X'y
'''

import numpy as np
import numpy.linalg as npl

def mC(X, y):
    """
    Devuelve el estimador de minimos cuadrados de b para y = Xb

    Si la matriz X es de rango completo, devuelve el estimador.
    
    Requiere numpy y numpy.linalg

    Parametros
    ----------
    X : numpy.array
        Matriz de tamano [m, k] de rango k
    y : numpy.array
        Vector de tamano m

    Returns
    -------
    numpy.array
        Estimador de minimos cuadrados de b (vector de tamano k)

    """
    if(npl.matrix_rank(X) == np.size(X, 1)):
        b = np.matmul(npl.inv(np.matmul(np.transpose(X), X)), np.matmul(np.transpose(X), y))
        print(npl.inv(np.matmul(np.transpose(X), X)))
        return b
    else:
        print("La matriz X no es de rango completo")
        return -1

X = np.array([[0.0,1.0],[2.0,3.0],[4.0,5.0]])
y = np.array([0.1,0.9,2.4])

print(mC(X, y))