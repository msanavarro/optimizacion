'''
Created on 23 sep. 2019

@author: MANUELSARMIENTO
'''

import configparser

config = configparser.ConfigParser()
config['DEFAULT'] = {'h_derivada' : '1e-8'}

with open('../../config/optimizacion.ini', 'w') as configfile:
    config.write(configfile)