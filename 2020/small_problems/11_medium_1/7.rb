# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# input: string sentence
# output: string sentence with words to digits
# data structure: split sentence into array then join to string
# algorithm:
# 1. split sentence into words array based on spaces.
# 1b. need to split full stops into separate array elements
# 2. check each word and change to digit if it matches a hash key
# 3. join with space
# 4. return

WORDS_AND_DIGITS = {
  'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(string)
  words = string.split
  digits = []
  words.each do |word|
    chars = word.chars
    new_word = ''
    0.upto(chars.size - 1) do |index|
      new_word << chars[index]
      if WORDS_AND_DIGITS.keys.include?(new_word)
        new_word = WORDS_AND_DIGITS[new_word]
      end
    end
    digits << new_word
  end
  digits.join(' ')
end

# def word_to_digit(string)
#   new_string = string
#   WORDS_AND_DIGITS.each do |word, digit|
#     new_string.gsub!(word, digit)
#   end
#   new_string
# end
# converts freight to fr8

def word_to_digit(string)
  new_string = string
  WORDS_AND_DIGITS.each do |word, digit|
    new_string.gsub!(/\b#{word}\b/, digit)
  end
  new_string
end

# Example:

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

puts '----'

# There are many ways to solve this problem and different varieties of it. Suppose, for instance, that we also want to replace uppercase and capitalized words.

def word_to_digit(string)
  new_string = string
  WORDS_AND_DIGITS.each do |word, digit|
    new_string.gsub!(/\b#{word}\b/i, digit)
  end
  new_string
end

p word_to_digit('Please call me at ONE TWO THREE FIVE five five one two three four. Thanks.') == 'Please call me at 1 2 3 5 5 5 1 2 3 4. Thanks.'

puts '----'

# Can you change your solution this so the spaces between consecutive numbers are removed? Suppose the string already contains two or more space separated numbers (not words); can you leave those spaces alone, while removing any spaces between numbers that you create?

# What about dealing with phone numbers? Is there any easy way to format the result to account for phone numbers? For our purposes, assume that any 10 digit number is a phone number, and that the proper format should be "(123) 456-7890".

def word_to_digit(string)
  new_string = string
  WORDS_AND_DIGITS.each do |word, digit|
    new_string.gsub!(/\b#{word}\b/i, digit)
  end
  phone = new_string.match(/[0-9\s]{20}/)[0][1..-1]
  cleaned_phone = phone.delete(' ')
  format_phone = "(#{cleaned_phone[0..2]}) #{cleaned_phone[3..5]}-#{cleaned_phone[6..10]}"
  new_string.gsub!(phone, format_phone)
  new_string
end

p word_to_digit('Please 1 2 3 call me at one two three five five five one two three four. Thanks.') == 'Please 1 2 3 call me at (123) 555-1234. Thanks.'
