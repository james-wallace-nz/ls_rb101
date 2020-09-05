# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(int)
  int_string = int.to_s
  int_string == int_string.reverse
end

# Examples:

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true

# puts '---------'

# Suppose your number begins with one or more 0s. Will your method still work? Why or why not? Is there any way to address this?

def palindromic_number?(int)
  int
  # int_string = int.to_s
  # p int_string
  # int_string.delete!('^[1-9]')
  # # puts int_string
  # int_string == int_string.reverse
end

puts palindromic_number?(00034543) # == true
# puts palindromic_number?(000123210) # == false
# puts palindromic_number?(00022) # == true
# puts palindromic_number?(0005) # == true
