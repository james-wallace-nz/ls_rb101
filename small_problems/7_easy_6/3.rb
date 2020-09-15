# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

# input: integer for number of digits
# output: integer index of first Fibonacci number that has the input number of digits
# algorithm:
# 1. set index = 1
# 2. increment fibonacci series
  # fib number - 1  + fib number - 2
# 3. check if digits equal to input integer
  # when fib number / 10 ** (digits input - 1) == 1
# 4. if so, end and return index
# 5. otherwise, increment loop and return to step 2

def find_fibonacci_index_by_length(num_digits)
  index = 2
  prior_fib_num = 1
  prior_prior_fib_num = 1
  loop do
    fibonacci_number = prior_fib_num + prior_prior_fib_num
    index += 1
    break if fibonacci_number / 10 ** (num_digits - 1) == 1
    prior_prior_fib_num = prior_fib_num
    prior_fib_num = fibonacci_number
  end
  index
end

# def find_fibonacci_index_by_length(num_digits)
#   fibonacci_series = [1, 1]
#   loop do
#     fibonacci_series << fibonacci_series[-1] + fibonacci_series[-2]
#     break if fibonacci_series[-1].to_s.size == num_digits
#   end
#   fibonacci_series.size
# end

# Examples:

puts find_fibonacci_index_by_length(2) == 7         #  1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12        #  1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847

# You may assume that the argument is always greater than or equal to 2.

puts '----'

# Fibonacci numbers are sometimes used in demonstrations of how to write recursive methods. Had we tried to use a recursive method, it probably would have resulted in the program running out of stack space. Ruby isn't well equipped to deal with the level of recursion required for a recursive solution.
