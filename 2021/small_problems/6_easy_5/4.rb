# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

# input: string of string
# output: string with first and last letters of every word swapped

# 1. split words into array
# 2. iterate through array elements with map
# 3. swap first and last letters
# 4. join words with spaces

def swap(string_of_words)
  words = string_of_words.split
  swapped_words = words.map do |word|
    first = word[0]
    last = word[-1]
    word[0], word[-1] = last, first
    word
  end
  swapped_words.join(' ')
end

# Examples:
puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

# Further Exploration
# How come our solution passes word into the swap_first_last_characters method invocation instead of just passing the characters that needed to be swapped? Suppose we had this implementation:

def swap_first_last_characters(a, b)
  a, b = b, a
end

# and called the method like this:

swap_first_last_characters(word[0], word[-1])

# Would this method work? Why or why not?

# This method wouldn't work because swap_first_last_characters doesn't have access to the 'word' element to mutate
