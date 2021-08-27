# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.


# PROBLEM:

# Compute the difference between the 'square of the sum' of the first `n` integers and 'sum of the square' of first 'n' positive integers


# DATA STRUCTURE:



# ALGORITHM:



# CODE:

def square_of_sum(array)
   array.sum ** 2
end

def sum_of_squares(array)
   squares = []
   array.each do |i|
      squares << i ** 2
   end
   squares.sum
end

def sum_square_difference(n)
   array = []
   1.upto(n) do |count|
      array << count
   end

   square_of_sum(array) - sum_of_squares(array)
end


# Examples:

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
