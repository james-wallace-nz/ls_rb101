# Consider the following method and a call to that method:

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# Use the ruby documentation to determine what this code will print.

# https://ruby-doc.org/core-3.0.1/doc/syntax/methods_rdoc.html#label-Default+Values

# Default Values¶ ↑
# Arguments may have default values:

# def add_values(a, b = 1)
#   a + b
# end
# The default value does not need to appear first, but arguments with defaults must be grouped together. This is ok:

# def add_values(a = 1, b = 2, c)
#   a + b + c
# end
# This will raise a SyntaxError:

# def add_values(a = 1, b, c = 1)
#   a + b + c
# end
# Default argument values can refer to arguments that have already been evaluated as local variables, and argument values are always evaluated left to right. So this is allowed:

# def add_values(a = 1, b = a)
#   a + b
# end
# add_values
# # => 2
# But this will raise a NameError (unless there is a method named b defined):

# def add_values(a = b, b = 1)
#   a + b
# end
# add_values
# NameError (undefined local variable or method `b' for main:Object)


# https://ruby-doc.org/core-3.0.1/doc/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments

# When the method defines default arguments you do not need to supply all the arguments to the method. Ruby will fill in the missing arguments in-order.

# First we’ll cover the simple case where the default arguments appear on the right. Consider this method:

# def my_method(a, b, c = 3, d = 4)
#   p [a, b, c, d]
# end
# Here c and d have default values which ruby will apply for you. If you send only two arguments to this method:

# my_method(1, 2)
# You will see ruby print [1, 2, 3, 4].

# If you send three arguments:

# my_method(1, 2, 5)
# You will see ruby print [1, 2, 5, 4]

# Ruby fills in the missing arguments from left to right.

# Ruby allows default values to appear in the middle of positional arguments. Consider this more complicated method:

# def my_method(a, b = 2, c = 3, d)
#   p [a, b, c, d]
# end
# Here b and c have default values. If you send only two arguments to this method:

# my_method(1, 4)
# You will see ruby print [1, 2, 3, 4].

# If you send three arguments:

# my_method(1, 5, 6)
# You will see ruby print [1, 5, 3, 6].

# Describing this in words gets complicated and confusing. I’ll describe it in variables and values instead.

# First 1 is assigned to a, then 6 is assigned to d. This leaves only the arguments with default values. Since 5 has not been assigned to a value yet, it is given to b and c uses its default value of 3.


# same as my_method(4, 5, 3, 6), therefore outputs and returns:
# [4, 5, 3, 6]
# => [4, 5, 3, 6]


# "default positional arguments"

 # The documentation shows that positional arguments are filled out first, then the default arguments are set with any values supplied, and, finally, default values are applied to anything remainin
