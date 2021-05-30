# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

def crunch(string)
  new_string = ''
  chars = string.split('')
  chars.each_with_index do |char, index|
    new_string << char unless char == chars[index + 1]
  end
  new_string
end

# Examples:

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''


puts '------'

# You may have noticed that we continue iterating until index points past the end of the string. As a result, on the last iteration text[index] is the last character in text, while text[index + 1] is nil. Why do we do this? What happens if we stop iterating when index is equal to text.length?




# Can you determine why we didn't use String#each_char or String#chars to iterate through the string? How would you update this method to use String#each_char or String#chars?

puts '------'

#  each_char and chars do not give us access to an index by default, so we can't access the next character in the series.

def crunch(string)
  index = 0
  crunched_string = ''
  while index <= string.size
    crunched_string << string[index] unless string[index] == string[index + 1]
    index += 1
  end
  crunched_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''


puts '----'

# You can solve this problem using regular expressions (see the Regexp class documentation). For a fun challenge, give this a try with regular expressions. If you haven't already read our book, Introduction to Regular Expressions, you may want to keep it handy if you try this challenge.

def crunch(string)
  string.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''


# Can you think of other solutions besides regular expressions?
