import argparse
import numpy as np 
from mpl_toolkits import mplot3d
import matplotlib.pyplot as plt 
import parser 
import ast 

args_parser = argparse.ArgumentParser(description='Generate parametric graph based on options. \n Example: Syntax: 2^e(3*x) + 1')
args_parser.add_argument('x', type=str, help='Parametric Function for X-Axis')
args_parser.add_argument('y', type=str, help='Parametric Function for Y-Axis')
args_parser.add_argument('z', type=str, help='Parametric Function for Z-Axis')
args_parser.add_argument('--domain-min',  type=str, default="-1", help="Min domain for parameter")
args_parser.add_argument('--domain-max',  type=str, default="1", help="Min domain for parameter")
args_parser.add_argument('--domain-step', type=str, default="100", help="Step interval for domain")

args = args_parser.parse_args();

# before we handle arguments, 
# we need to convert expressions given from the user to
# python parsable code 
def args_clean(string):
	# common functions
	string = string.replace("sin", "np.sin")
	string = string.replace("cos", "np.cos")
	string = string.replace("tan", "np.tan")
	string = string.replace("e^",  "np.exp")
	string = string.replace("ln",  "np.log")
	string = string.replace("sqrt", "np.sqrt")
	# operators 
	string = string.replace("^", "**") # errors occuring with ^
	string = string.replace("pi", "np.pi")

	return string

# compile expressions
def args_function(x,y,z):
	funcs = []
	funcs.append(eval(parser.expr(args_clean(x)).compile()))
	funcs.append(eval(parser.expr(args_clean(y)).compile()))
	funcs.append(eval(parser.expr(args_clean(z)).compile()))
	return funcs 

# express parameters in global domain 
d = args_function(args.domain_min, args.domain_max, args.domain_step)
t = np.linspace(d[0], d[1], d[2])

# generate graph
plt.rcParams['legend.fontsize'] = 10
funcs = args_function(args.x, args.y, args.z)
fig = plt.figure()
ax = fig.gca(projection='3d')
ax.plot(funcs[0], funcs[1], funcs[2])
plt.show()