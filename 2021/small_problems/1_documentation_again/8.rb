# Ruby version 2.4.0 introduced an Array#min method not available in prior versions of Ruby; we wrote this exercise before that release. To follow along, please use the documentation for Ruby 2.3.0 here.

# Use irb to run the following code:

a = [5, 9, 3, 11]
puts a.min
p a.min(2)

# Find the documentation for the #min method and change the above code to print the two smallest values in the Array.

# A solution that uses the #min method alone requires version 2.2.0 or higher of Ruby. If you have an older version of Ruby, you need a different approach.

# Some languages have a feature called multiple inheritance (aka, MI). With MI, as it's often abbreviated, a class can inherit from two or more immediate superclasses. Inheriting from multiple superclasses, though, has pitfalls. To avoid these pitfalls, Ruby doesn't allow MI.

# Ruby uses something like MI, but without the worst of the pitfalls: mix-in modules. They provide a way for classes of different types to share behaviors without using inheritance.

# A class can use a mix-in module by using the include method. Once included, all the mix-in's methods become available to objects of the class.

p a.sort.take(2)
