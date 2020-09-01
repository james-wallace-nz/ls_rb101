# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# input: string of words separated by spaces
# output: string - words with >5 char reversed
# data structure: convert to array then convert result to string
# algorithm:
# 1. split string into array of word strings
# 2. map words to new array and reverse those that have > 5 characters
# 3. join the array back to a string with a space

def reverse_words(string)
  array = string.split
  array.map! do |word|
    word.length >= 5 ? word.reverse : word
  end
  array.join(' ')
end

def reverse_words(string)
  words = []
  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end
  words.join(' ')
end
# Examples:

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
