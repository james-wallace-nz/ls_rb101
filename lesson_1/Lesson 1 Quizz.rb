# 5.

# takes one argument, a sentence string
# returns an array of integers
# Value of each integer in the array should be equal to the length of the word in the corresponding position on the sentence.


# def string_lengths(sentence)
#   strings = sentence.split

#   strings.map { |chars| chars.length }
# end

# Yes


# def string_lengths(sentence)
#   strings = sentence.split
#   lengths = []

#   strings.each do |string|
#     lengths << string.size
#   end
# end

# No, #each returns the original array


# def string_lengths(sentence)
#   words = sentence.split
#   word_lengths = []
#   counter = 0

#   while counter < words.size do
#     word_lengths << words[counter].length
#     counter += 1
#   end

#   word_lengths
# end

# Yes


# def string_lengths(sentence)
#   strings = sentence.split
#   lengths = []
#   counter = 1

#   until counter == strings.size do
#     word_length = strings[counter - 1].length
#     lengths.push(word_length)
#     counter += 1
#   end

#   lengths
# end

# No, loop stops before completing last string when counter == string.size

p string_lengths('To be or not to be')
