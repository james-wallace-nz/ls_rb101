# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

def is_odd?(number)
  number % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# This solution relies on the fact that % is the modulo operator in Ruby, not a remainder operator as in some other languages. Remainder operators return negative results if the number on the left is negative, while modulo always returns a non-negative result if the number on the right is positive.

def is_odd?(number)
  number.remainder(2) != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
