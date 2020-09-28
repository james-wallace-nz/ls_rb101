# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# input: string
# output: hash

# hash contains:
# 1. % of characters that are lowercase
# 2. % of characters that are uppercase
# 3. % of charactesr that are neither
# percentage is integer or float

# algorithm:
# 1. set hash values to 0
# 2. count lowercase
# 3. count uppercase
# 4. % lowercase to hash
# 5. % uppercase to hash
# 6. 100 - 4 - 5 to hash


def letter_percentages(string)
  result = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  lowercase = string.count('a-z')
  uppercase = string.count('A-Z')
  neither = string.size - lowercase - uppercase
  lowercase_percent = lowercase / string.size.to_f * 100
  uppercase_percent = uppercase / string.size.to_f * 100
  neither_percent = neither / string.size.to_f * 100

  if lowercase_percent.to_s[-1] == '0'
    lowercase_percent = lowercase_percent.to_i
  end

  if uppercase_percent.to_s[-1] == '0'
    uppercase_percent = uppercase_percent.to_i
  end

  if neither_percent.to_s[-1] == '0'
    neither_percent = neither_percent.to_i
  end

  result[:lowercase] = lowercase_percent
  result[:uppercase] = uppercase_percent
  result[:neither] = neither_percent
  result
end

# Solution:

# def letter_percentages(string)
#   counts = { lowercase: 0, uppercase: 0, neither: 0 }
#   percentages = { lowercase: [], uppercase: [], neither: [] }
#   characters = string.chars
#   length = string.length

#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

#   calculate(percentages, counts, length)

#   percentages
# end

# def calculate(percentages, counts, length)
#   percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
#   percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
#   percentages[:neither] = (counts[:neither] / length.to_f) * 100
# end

# Examples

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

puts '-------'

# If we passed a string 'abcdefGHI' as an argument to our method call the solution would be {:lowercase=>66.66666666666666, :uppercase=>33.33333333333333, :neither=>0.0}. It would be nicer if we could round these float numbers so that our solution looks like this {:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}. Try creating that solution on your own

def letter_percentages(string)
  result = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  lowercase = string.count('a-z')
  uppercase = string.count('A-Z')
  neither = string.size - lowercase - uppercase
  lowercase_percent = lowercase / string.size.to_f * 100
  uppercase_percent = uppercase / string.size.to_f * 100
  neither_percent = neither / string.size.to_f * 100

  if lowercase_percent.to_s[-1] == '0'
    lowercase_percent = lowercase_percent.to_i
  end

  if uppercase_percent.to_s[-1] == '0'
    uppercase_percent = uppercase_percent.to_i
  end

  if neither_percent.to_s[-1] == '0'
    neither_percent = neither_percent.to_i
  end

  result[:lowercase] = lowercase_percent.round(2)
  result[:uppercase] = uppercase_percent.round(2)
  result[:neither] = neither_percent.round(2)
  result
end

p letter_percentages('abcdefGHI') #== {:lowercase=>66.66666666666666, :uppercase=>33.33333333333333, :neither=>0.0}
