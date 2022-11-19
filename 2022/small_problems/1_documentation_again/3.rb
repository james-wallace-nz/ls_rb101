def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# outputs: [4, 5, 3, 6

# https://ruby-doc.org/core-2.5.0/doc/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments]

# When the method defines default arguments you do not need to supply all the arguments to the method. Ruby will fill in the missing arguments in-order.

#   Ruby fills in the missing arguments from left to right.

#   First 1 is assigned to a, then 6 is assigned to d. This leaves only the arguments with default values. Since 5 has not been assigned to a value yet, it is given to b and c uses its default value of 3

 # The documentation shows that positional arguments are filled out first, then the default arguments are set with any values supplied, and, finally, default values are applied to anything remaining.
