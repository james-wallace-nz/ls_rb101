# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(string)
  string.chars.reduce(0) { |sum, e| sum + e.ord }
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0


puts 'F'.ord.chr
puts 'Four score'.ord.chr

# Integer#chr will return the string character of the integer ordinal
# For multi-character strings, String#ord will only return the ord for the first character
