# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

def average(numbers)
  # sum = numbers.reduce { |sum, number| sum + number }
  sum = numbers.reduce(&:+)
  sum / numbers.size
end

# Examples:
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
# The tests above should print true.


def average(numbers)
  # sum = numbers.reduce { |sum, number| sum + number }
  sum = numbers.reduce(&:+)
  sum / numbers.size.to_f
end

# Examples:
puts average([1, 6]) == 3.5 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25.666666666666668
puts average([9, 47, 23, 95, 16, 52]) == 40.333333333333336