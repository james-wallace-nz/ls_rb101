# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# a) increment 1 to int and total then square
# b) increment 1 squared to int squared and total
# a - b

def sum_square_difference(int)
  square_of_sum = 0
  sum_of_squares = 0
  1.upto(int) do |num|
    square_of_sum += num
    sum_of_squares += num**2
  end
  square_of_sum**2 - sum_of_squares
end

# Examples:

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
