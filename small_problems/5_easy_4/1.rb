# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

# inputs: 2 strings
# outputs: shortlongshort string concatenated
# algorithm:
# 1. compare 1 and 2 to determine which is longer
# 2. concatenate in right order

def short_long_short(string_one, string_two)
  if string_one.size > string_two.size
    long = string_one
    short = string_two
  else
    long = string_two
    short = string_one
  end
  short + long + short
end

# Examples:

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
