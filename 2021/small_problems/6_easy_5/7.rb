# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

# LETTERS = ('a'..'z').to_a

# def cleanup_chars(word)
#   fixed_chars = []
#   chars = word.chars
#   chars.each do |char|
#     if LETTERS.include?(char.downcase)
#       fixed_chars << char
#     elsif fixed_chars[-1] != ' '
#       fixed_chars << ''
#     end
#   end
#   fixed_chars.join
# end

# def cleanup_words(array)
#   fixed_words = []
#   array.each do |word|
#     fixed_words << cleanup_chars(word)
#   end
#   fixed_words
# end

# def word_sizes(string)
#   sizes = Hash.new(0)
#   words = string.split
#   clean_words = cleanup_words(words)
#   clean_words.each do |word|
#     sizes[word.size] += 1
#   end
#   sizes
# end

def word_sizes(string)
  sizes = Hash.new(0)
  string.split.each do |word|
    clean_word = word.delete("^A-Za-z")
    sizes[clean_word.size] += 1
  end
  sizes
end

# Examples
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
