'''
Created on 8 sep. 2019

@author: msanavarro
'''
from root.configFileReader import config

'''
El estimador de mínimos cuadrados de b para el problema y=Xb es
b=((X'X)^-1)X'y
'''

import numpy as np
from root import configFileReader, basics

def mC(X, y):
    """
    Devuelve el estimador de mínimos cuadrados de b para y = Xb

    Si la matriz X es de rango completo, devuelve el estimador de mínimos 
    cuadrados de b para el problema y = Xb, que es b=((X'X)^-1)X'y. En caso 
    contrario regresa None
    
    Requiere numpy

    Parametros
    ----------
    X : numpy.array
        Matriz de tamaño [m, k] de rango k
    y : numpy.array
        Vector de tamaño m

    Returns
    -------
    numpy.array
        Estimador de mínimos cuadrados de b (vector de tamaño k)

    """
    if(type(X)==np.ndarray and type(y)==np.ndarray):
        if(np.size(X,0)==np.size(y,0)):
            if(np.linalg.matrix_rank(X) == np.size(X, 1)):
                try:
                    b = np.matmul(np.linalg.inv(np.matmul(np.transpose(X), X)), np.matmul(np.transpose(X), y))
                    return b
                except:
                    print("Ocurrio un error al calcular b")
                    return
            else:
                print("La matriz X no es de rango completo")
                return
        else:
            print("Las dimensiones de X y de y no concuerdan")
            return 
    else:
        print("Los objetos que se recibieron no son del tipo numpy.ndarray")
        return

def riesgo_empirica_mC(beta, X, y):
    L = 0
    (m, n) = X.shape
    for i in range(0, m):
        L = (np.dot(beta, X[i]) - y[i])**2
    L = L / m
    return L

def metodo_gradiente(X, y, eta=configFileReader.eta, eps=configFileReader.eps):
    """
    Devuelve el estimador de beta del modelo [beta'*x ~ y] 
    usando el metodo del gradiente
    
    Requiere numpy

    Parametros
    ----------
    X : numpy.array [X.shape=(m,p)]
        Datos de entrenamiento de las variables explicativas
    y : numpy.array [y.shape=(m,)]
        Datos de entrenamiento de la variable de respuesta

    Resultado
    -------
    numpy.array
        Estimador de beta

    """
    beta = np.array(0)
    def f(beta):
        return(riesgo_empirica_mC(beta, X, y))
    
    k = 0
    while (k < configFileReader.maxiter):
        beta = beta - (eta *  basics.gradiente(f, beta))
        k += 1
    return(beta)

X = np.array([[0.0,1.0],[2.0,3.0],[4.0,5.0]])
#X = np.array([[0.0,1.0],[0.0,1.0],[0.0,1.0]])
#X='A'
y = np.array([0.1,0.9,2.4])

print('............................')
print(mC(X, y))
print('............................')
print(metodo_gradiente(X, y))
print('............................')


