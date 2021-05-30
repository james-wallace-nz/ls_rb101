# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# input: positive integer
# output: integer - sum of integer digits
# algorithm:
# 1. convert int to string and then split chars into array
# 2. map chars to integers
# 3. reduce integers to total

def sum(int)
  chars = int.to_s.chars
  # chars.map! { |char| char.to_i }
  chars.map!(&:to_i)
  chars.reduce(:+)
end

# Examples:

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# The tests above should print true.

# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).
