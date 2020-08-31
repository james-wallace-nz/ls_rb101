# Ruby version 2.4.0 introduced an Array#min method not available in prior versions of Ruby; we wrote this exercise before that release. To follow along, please use the documentation for Ruby 2.3.0 here.

# Use irb to run the following code:

a = [5, 9, 3, 11]
puts a.min

# Find the documentation for the #min method and change the above code to print the two smallest values in the Array.

# A solution that uses the #min method alone requires version 2.2.0 or higher of Ruby. If you have an older version of Ruby, you need a different approach.


# Array includes the Enumberable is a module
# https://ruby-doc.org/core-2.3.0/Enumerable.html#method-i-min

# min → obj
# min {| a,b | block } → obj
# min(n) → array
# min(n) {| a,b | block } → array
# Returns the object in enum with the minimum value. The first form assumes all objects implement Comparable; the second uses the block to return a <=> b.

# a = %w(albatross dog horse)
# a.min                                   #=> "albatross"
# a.min { |a, b| a.length <=> b.length }  #=> "dog"
# If the n argument is given, minimum n elements are returned as an array.

# a = %w[albatross dog horse]
# a.min(2)                                  #=> ["albatross", "dog"]
# a.min(2) {|a, b| a.length <=> b.length }  #=> ["dog", "horse"]

puts a.min(2)

# For pre-2.2.0 versions of Ruby

# a = [5, 9, 3, 11]
# puts a.sort.take(2)
