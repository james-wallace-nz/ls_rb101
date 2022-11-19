# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.

# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

def valid_integer?(num)
  /^\d+$/.match(num)
end

def valid_operator?(operator)
  operator == 's' || operator == 'p'
end

def compute_sum(integer)
  (1..integer).reduce(:+)
end

def compute_product(integer)
  (1..integer).reduce(:*)
end

integer = 0
loop do
  puts "Please enter an integer greater than 0:"
  integer = gets.chomp
  break if valid_integer?(integer)
  puts "Invalid integer. Try again"
end

integer = integer.to_i

operator = ''
loop do
  puts "Enter 's' to computer the sum, 'p' to compute the product."
  operator = gets.chomp.downcase
  break if valid_operator?(operator)
  puts "Invalid operator. Try again"
end

case operator
when 's'
  sum = compute_sum(integer)
  puts "The sum of the integers between 1 and #{integer} is #{sum}"
when 'p'
  product = compute_product(integer)
  puts "The product of the integers between 1 and #{integer} is #{product}"
else puts 'Error'
end
