# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

# input: string of one or more words separated by spaces
# outputs: string of same words with first and last letters of each word swapped
# algorithm:
# 1. split string by spaces into array
# 2. iterate over each word
# 3. transform each word by swapping first and last characters
# 4. join array with spaces

def swap(string)
  words = string.split(' ')
  words.map do |word|
    first_char = word[0]
    last_char = word[-1]
    word[0] = last_char
    word[-1] = first_char
    word
  end
  words.join(' ')
end

# Examples:

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

puts '-------'

# How come our solution passes word into the swap_first_last_characters method invocation instead of just passing the characters that needed to be swapped? Suppose we had this implementation:

def swap_first_last_characters(a, b)
  a, b = b, a
end

# and called the method like this:

swap_first_last_characters(word[0], word[-1])

# Would this method work? Why or why not?

# This method wouldn't work. Passing the characters of the word would pass, for example, w and t. The swap_first_last_characters method could not mutate the word even though it can swap the order of the characters that it returns.
