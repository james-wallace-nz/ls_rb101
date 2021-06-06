# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

def short_long_short(str_one, str_two)
  new_string = ''
  if str_one.length > str_two.length
    new_string << str_two << str_one << str_two
  else
    new_string << str_one << str_two << str_one
  end
  new_string
end

# Examples:
puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
