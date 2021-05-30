# What do each of these puts statements output?

a = %w(a b c d e)     # ['a', 'b', 'c', 'd', 'e']
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }

# IndexError
# beats me
# 49

#fetch simply returns the element of an Array by its index, but it also does bounds checking (which Array#[] does not); that is, it checks whether the specified element actually exists before fetching it, and raises an error if it does not exist
