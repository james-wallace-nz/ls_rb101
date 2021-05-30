# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

ALPHABET = ('a'..'z').to_a

def size(word)
  size = 0
  word.split('').each do |letter|
    size += 1 if ALPHABET.include?(letter.downcase)
  end
  size
end

def word_sizes(string)
  word_length_frequencies = Hash.new(0)
  string.split.each do |word|
    word_length_frequencies[size(word)] += 1
  end
  word_length_frequencies
end

puts '-----'

def word_sizes(string)
  word_length_frequencies = Hash.new(0)
  string.split.each do |word|
    clean_word = word.delete("^a-zA-Z")
    word_length_frequencies[clean_word.size] += 1
  end
  word_length_frequencies
end

# Examples

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
