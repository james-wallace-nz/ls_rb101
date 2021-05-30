# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# input: integer
# output: array of digit

# Algorithm:
# convert to string, split into chars array, map back to integers


def digit_list(int)
  array = int.to_s.split('')
  array.map! { |char| char.to_i }
end

# or

# Algorithm:
# int.divmod(10)

def digit_list(int)
  digits = []
  loop do
    int, digit = int.divmod(10)
    digits.unshift(digit)
    break if int == 0
  end
  digits
end


# Examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true




