# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

# input: two strings
# outputs: one string - short, long, short concatenated
# algo:
# determine shortest of two
# concatenate short, long, short
# return

def short_long_short(a, b)
  short, long = [a, b].sort_by { |a| a.size }
  short + long + short
end

# Examples:

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
