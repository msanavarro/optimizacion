'''
Created on 8 sep. 2019

@author: msanavarro
'''

'''
El estimador de m�nimos cuadrados de b para el problema y=Xb es
b=((X'X)^-1)X'y
'''

import numpy as np

def mC(X, y):
    """
    Devuelve el estimador de m�nimos cuadrados de b para y = Xb

    Si la matriz X es de rango completo, devuelve el estimador de m�nimos 
    cuadrados de b para el problema y = Xb, que es b=((X'X)^-1)X'y. En caso 
    contrario regresa None
    
    Requiere numpy

    Parametros
    ----------
    X : numpy.array
        Matriz de tama�o [m, k] de rango k
    y : numpy.array
        Vector de tama�o m

    Returns
    -------
    numpy.array
        Estimador de m�nimos cuadrados de b (vector de tama�o k)

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
    

X = np.array([[0.0,1.0],[2.0,3.0],[4.0,5.0]])
#X = np.array([[0.0,1.0],[0.0,1.0],[0.0,1.0]])
#X='A'
y = np.array([0.1,0.9,2.4])

print(mC(X, y))