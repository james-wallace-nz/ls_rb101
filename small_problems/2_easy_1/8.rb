# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

# input: array of positive integers
# output: integer - average of array of integers
# algorithm:
# 1. reduce array with + to sum up total
# 2. divide total by array size to get average

def average(array)
  # numerator = array.reduce(:+)
  numerator = array.reduce { |sum, number| sum + number }
  denominator = array.size
  average = numerator / denominator
end

def average(array)
  total = 0
  array.each { |int| total += int }
  total / array.size
end

# Examples:

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# The tests above should print true.

puts '---------'

# Currently, the return value of average is an Integer. When dividing numbers, sometimes the quotient isn't a whole number, therefore, it might make more sense to return a Float. Can you change the return value of average from an Integer to a Float?

def average(array)
  numerator = array.reduce(:+)
  denominator = array.size
  average = numerator / denominator.to_f
end

puts average([1, 6]) == 3.5 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25.666666666666668
puts average([9, 47, 23, 95, 16, 52]) == 40.333333333333336
