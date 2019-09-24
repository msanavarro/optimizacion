'''
Created on 23 sep. 2019

@author: MANUELSARMIENTO
'''

import configparser

config = configparser.ConfigParser()
config.read('../../config/optimizacion.ini')

h_derivada = float(config['DEFAULT']['h_derivada'])