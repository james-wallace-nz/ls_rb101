# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

def stringy(integer)
  string = ''
  integer.times do |idx|
    string << ( idx.even? ? '1' : '0' )
  end
  string
end


def stringy(integer, even = '1')
  odd = ( even == '1' ? '0' : '1' )
  string = ''
  integer.times do |idx|
    string << ( idx.even? ? even : odd )
  end
  string
end

# Examples:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# The tests above should print true.

puts stringy(6, '0') == '010101'
puts stringy(9, '0') == '010101010'
puts stringy(4, '0') == '0101'
puts stringy(7, '0') == '0101010'