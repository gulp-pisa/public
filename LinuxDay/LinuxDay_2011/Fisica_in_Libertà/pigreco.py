#pigreco.py
#Copyright 2011 (C) Jacopo Nespolo
#This program is free software and is released under the terms of the 
#GNU General Public License, either version 3 or, at your option, any
#subsequent version.

# In Debian, this program requires the package
# python-matplotlib

from random import uniform
from pylab import ion, plot, draw
from math import pi

def generate_numbers():
    return (uniform(-1.,1.),uniform(-1.,1.))

def is_in_circle(xy):
    norm = xy[0]**2+xy[1]**2
    if norm <= 1:
        return 1
    else: return 0
    
def estimate_pi(total, in_circle):
    return (in_circle*4./total)
    
if __name__ == '__main__':
    
    _MAX_ITERATION = 10**6
    f = open('./error.txt', 'w')
    
    pi_estimate = 0
    in_circle = 0
    
    to_plot = ([],[])
    error = ([],[])
    
    ion()
    # Graphing initialisation
    line, = plot(to_plot[0], to_plot[1], ',')
    # This starts animated graphing
    
    for i in xrange(1,_MAX_ITERATION):
        xy = generate_numbers()
        in_circle += is_in_circle(xy)
        pi_estimate = estimate_pi(i, in_circle)

        #GRAPHING STARTS HERE
        if (i%1000==0):
            to_plot[0].append(xy[0])
            to_plot[1].append(xy[1])
            line.set_xdata(to_plot[0])
            line.set_ydata(to_plot[1])
            draw()
            print("%f\t\t%d" %(pi_estimate, i))
            f.write('%d\t%f\n' %(i, pi_estimate-pi))
            
    while(true):
        pass