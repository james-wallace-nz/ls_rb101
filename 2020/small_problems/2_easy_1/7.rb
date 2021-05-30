# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# input: positive integer
# output: string
# algorithm:
# 1. create empty string
# 2. loop interger times
# 3. add count % 2 to string with push/shovel
# 4. return string

def stringy(int)
  string = ''
  count = 1
  int.times do
    string << "#{count % 2}"
    count += 1
  end
  string
end

def stringy(int)
  numbers = []
  int.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end
  numbers.join
end

# Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# The tests above should print true.

puts "----"

# Modify stringy so it takes an additional optional argument that defaults to 1. If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy(int, start = 1)
  numbers = []
  int.times do |index|
    number = index.even? ? start : (1 - start)
    numbers << number
  end
  numbers.join
end

puts stringy(6, 1) == '101010'
puts stringy(9, 1) == '101010101'
puts stringy(4, 1) == '1010'
puts stringy(7, 1) == '1010101'

puts "----"

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'
