# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# input: string
# output: next to last work in string passed in
# word is sequence of non-blank characters

def penultimate(string)
  string.split[-2]
end

# Examples:
puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
