# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

LOWERCASE = ('a'..'z').to_a

def uppercase?(string)
  result = true
  string.chars.each do |char|
    result = false if LOWERCASE.include?(char)
  end
  result
end

def uppercase?(string)
  string == string.upcase
end

# Examples:

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

puts '----'

# Food for thought: in our examples, we show that uppercase? should return true if the argument is an empty string. Would it make sense to return false instead? Why or why not?

# Yes, it would make more sense for empty string to return false. Since there are no characters in an empty string there are none that can be uppercase
