# Given the array...

# input: array of strings
# output: print array of anagrams - words with the same letters in different orders
# algo:
# 1. create sorted_words hash - each word in words is sorted by character. sorted_word is the key with empty array as value
# 2. iterate through words and add element to sorted_words hash value array
# 3. iterate through nested arrays and print

def anagrams(words)
  anagrams = Hash.new
  sorted_words = words.map { |word| word.chars.sort.join }.uniq
  sorted_words.each { |sorted_word| anagrams[sorted_word] = [] }
  words.each do |word|
    anagrams[word.chars.sort.join] << word
  end
  anagrams.each_value do |value|
    p value
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams(words)

# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)
