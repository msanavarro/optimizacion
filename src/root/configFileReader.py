'''
Created on 23 sep. 2019

@author: MANUELSARMIENTO
'''

import configparser
from builtins import int

config = configparser.ConfigParser()
config.read('../../config/optimizacion.ini')

h_derivada = float(config['DEFAULT']['h_derivada'])
eps = float(config['DEFAULT']['eps'])
eta = float(config['DEFAULT']['eta'])
maxiter = int(config['DEFAULT']['maxiter'])