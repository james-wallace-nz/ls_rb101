# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

# input: integer is number of digits
# output: index, starting at 1

# algo:
# 1. start count at 1
# 2. increment fibonacci series
# 3. check each new fib element for digit count
# 4. return count or increment count

def next_fib(last_two, last_one)
  return last_one if last_two.nil?
  last_two + last_one
end

def find_fibonacci_index_by_length(digits)
  count = 1
  fibonacci = [1]
  while fibonacci[-1].to_s.size < digits
    fibonacci << next_fib(fibonacci[-2], fibonacci[-1])
    count += 1
  end
  count
end

# Examples:
puts find_fibonacci_index_by_length(2) == 7         #  1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12        #  1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847

# You may assume that the argument is always greater than or equal to 2
