# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# input: string
# output: hash
# algorithm:
# 1. split words into array separated by spaces
# 2. map word length to array
# 3. calculate frequency of word lengths and save in hash


def word_sizes(string)
  words = string.split(' ')
  word_lengths = words.map { |word| word.size }
  word_length_frequencies = Hash.new(0)
  word_lengths.each do |word_length|
    word_length_frequencies[word_length] += 1
  end
  word_length_frequencies
end

def word_sizes(string)
  word_length_frequencies = Hash.new(0)
  string.split.each do |word|
    word_length_frequencies[word.size] += 1
  end
  word_length_frequencies
end

# Examples

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
