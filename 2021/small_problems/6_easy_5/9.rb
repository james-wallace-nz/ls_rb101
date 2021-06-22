# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

# input: string
# output: new string with consecutive duplicate characters collapsed into one
# constraint: can't use #sqeeuze or #squeeze!
# algo:
# 1. split string into words
# 2. iterate through characters
# 3. create new empty string
# 4. if character equal to prior character then skip, else add to new string
# 5. return new empty string

def crunch(string)
  words = string.split
  new_words = []
  words.each do |word|
    new_word = ''
    word.chars.each_with_index do |char, idx|
      if idx == 0
        new_word << char
      else
        new_word << char unless word[idx - 1] == char
      end
    end
    new_words << new_word
  end
  new_words.join(' ')
end

# Examples:
puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
