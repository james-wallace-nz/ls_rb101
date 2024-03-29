# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(string)
  value = 0
  string.each_char do |char|
    value += char.ord
  end
  value
end


puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0


# There is an Integer method such that:

# char.ord.mystery == char

# where mystery is our mystery method. Can you determine what method name should be used in place of mystery?
#chr
puts ascii_value('a')
puts 97.chr

# What happens if you try this with a longer string instead of a single character?

# puts 1020102.chr
# RangeError: out of char range
