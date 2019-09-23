'''
Created on 23 sep. 2019

@author: MANUELSARMIENTO
'''

import configparser

config = configparser.ConfigParser()
config.read('../../config/optimizacion.ini')

print(float(config['DEFAULT']['h_derivada'])*2)