# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.

# 1+2+3+4+5 = 15

# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# 1*2*3*4*5*6 = 720

puts 'Please enter an integer greater than 0: '
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp.downcase

def sum(number)
  count = 2
  sum = 1
  loop do
    break if count > number

    sum += count
    count += 1
  end
  sum
end

def product(number)
  count = 2
  product = 1
  loop do
    break if count > number

    product *= count
    count += 1
  end
  product
end

if integer.positive?
  if operation == 's'
    puts "The sum of the integers between 1 and #{integer} is #{sum(integer)}."
  elsif operation == 'p'
    puts "The product of the integers between 1 and #{integer} is #{product(integer)}"
  else
    puts "Please enter 's' or 'p' for operation."
  end
else
  puts 'Please enter a positive integer'
end

# Refactor:

puts 'Please enter an integer greater than 0: '
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp.downcase

def sum(number)
  sum = 0
  1.upto(number) { |num| sum += num }
  sum
end

def product(number)
  product = 1
  1.upto(number) { |num| product *= num }
  product
end

if integer.positive?
  if operation == 's'
    puts "The sum of the integers between 1 and #{integer} is #{sum(integer)}."
  elsif operation == 'p'
    puts "The product of the integers between 1 and #{integer} is #{product(integer)}"
  else
    puts "Please enter 's' or 'p' for operation."
  end
else
  puts 'Please enter a positive integer'
end

# Further Exploration
# The compute_sum and compute_product methods are simple and should be familiar. A more rubyish way of computing sums and products is with the Enumerable#inject method. #inject is a very useful method, but if you've never used it before, it can be difficult to understand.
# Take some time to read the documentation for #inject. (Note that all Enumerable methods can be used on Array.) Try to explain how it works to yourself.
# Try to use #inject in your solution to this problem.

# def sum(number)
#   num_array = Array.new(number) { |index| index + 1 }
#   num_array.inject { |memo, n| memo + n }
# end

# def product(number)
#   num_array = Array.new(number) { |index| index + 1 }
#   num_array.inject { |memo, n| memo * n }
# end

puts 'Please enter an integer greater than 0: '
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp.downcase

def result(number, method)
  (1..number).inject(method)
end

if integer.positive?
  if operation == 's'
    puts "The sum of the integers between 1 and #{integer} is #{result(integer, :+)}."
  elsif operation == 'p'
    puts "The product of the integers between 1 and #{integer} is #{result(integer, :*)}"
  else
    puts "Please enter 's' or 'p' for operation."
  end
else
  puts 'Please enter a positive integer'
end
