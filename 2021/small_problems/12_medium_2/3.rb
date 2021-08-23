# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# PROBLEM:

# Input: String
# Output: Hash, { lowercase: '%', uppercase: '%', neither: '%' }
# % is Float with one decimal place

# space is a character

# EXAMPLES:

# 'abCdef 123'  = 10 characters
# abdef         = 5 => 50.0
# C             = 1 => 10.0
#  123          = 4 => 40.0

# 'AbCd +Ef'    = 8 characters
# bdf           = 3 => 37.5
# ACE           = 3 => 37.5
#  +            = 2 => 25.0

# DATA STRUCTURES:

# String
# Hash

# ALGORITHM:

# - iterate through characters in the string including spaces
#   - for each character determine if lowercase, uppercase, or neither
#   - when type determined, add to count for that type
# - divide each type total by total string length

def letter_percentages(string)
  totals = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }

  string.chars.each do |char|
    case char
    when /[a-z]/ then totals[:lowercase] += 1
    when /[A-Z]/ then totals[:uppercase] += 1
    else              totals[:neither] += 1
    end
  end

  totals.each do |type, sum|
    totals[type] = (sum / string.length * 100).round(1)
  end
  totals
end

# Examples

puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
puts letter_percentages('abcdefGHI') == { lowercase: 66.7, uppercase: 33.3, neither: 0.0 }
