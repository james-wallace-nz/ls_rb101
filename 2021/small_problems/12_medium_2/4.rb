# Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# PROBLEM

# Input: String
# Output: Boolean - true if all parentheses are properly balanced

# Balanced:
# count running total of opening and closing parentheses
# Add one for open
# Subtract one for closing
# Unbalanced if < 0 at any point
# Balanced if final total = 0

# DATA STRUCTURES

# String
# Integer
# Boolean

# ALGORITHM

# - Initialized `result` to `true`
# - Initialize `running_total` to `0`
# - Iterate through characters in the string
#   -  if '(' then increase `running_total` by `1`
#   -  if ')' then substract `1` from `running_total`
#   - if `running_total` less than `0` then set `result` to `false`
# - if `running_total` not equal to `0` then set `result` to `false`

# CODE

def balanced?(string)
  result = true
  running_total = 0

  string.chars.each do |char|
    running_total += 1 if char == '('
    running_total -= 1 if char == ')'
    return false if running_total < 0
  end

  return false if running_total != 0

  true
end


# Examples:

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false

# Note that balanced pairs must each start with a (, not a ).
