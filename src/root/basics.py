'''
Created on 2 sep 2019

@author: msanavarro
'''

from root import configFileReader
import numpy as np

def gradiente(f, x, h=configFileReader.h_derivada):
    """
    Devuelve una aproximacion al gradiente de la funcion f en x
    
    Requiere numpy

    Parametros
    ----------
    f : function (se verifica que lo sea con callable(f))
        Funcion que transforma un vector de tamano m en uno de tamano n
    y : numpy.array
        Vector de tamaño m
    h : el denominador de la definicion de derivada lim (h->0) (f(x+h)-f(x))/h

    Resultado
    -------
    numpy.array
        Aproximacion del gradiente, es un vector de tamano n

    """
    if(callable(f) and type(x) == np.ndarray):
        try:
            dG = (f(x+h) - f(x)) / h
            return dG
        except:
            print("Ocurrio un error al calcular dG")
            return 
    else:
        print("Los objetos que se recibieron no son del tipo function y numpy.ndarray respectivamente")
        return


def hessiana(f, x):
    return


def metodoNewton(x):
    return x


