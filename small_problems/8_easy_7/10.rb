# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(string)
  string.split(' ')[-2]
end

# Examples:

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

puts '----'

# Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.

# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

# even number of words has no middle case
# one word
# no words

def penultimate(string)
  words = string.split(' ')
  if words.size == 1 || words.empty?
    middle = 0
  elsif words.size.even?
    return
  else
    middle = words.size / 2
  end
  words[middle]
end

# Examples:

p penultimate('Launch School is so great!') == 'is'
p penultimate('last') == 'last'
p penultimate('') == nil
p penultimate('last word') == nil
p penultimate('Launch School is great!') == nil
