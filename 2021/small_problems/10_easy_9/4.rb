# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

def sequence(int)
  result = []
  1.upto(int) { |x| result << x }
  result
end

def sequence(int)
  (1..int).to_a
end

# Examples:
puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
