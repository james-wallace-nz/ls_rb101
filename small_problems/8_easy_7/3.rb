# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# input: string
# output: new string

# algorithm:
# split string into array of words
# iterate through each word in array of words
# iterate through each character in word
# if index # == 0 then uppercase
# otherwise lowercase
# join array into string and return

def word_cap(string)
  words = string.split
  words.map! do |word|
    index = -1
    word_chars = word.chars
    word_chars.map! do |char|
      index += 1
      index == 0 ? char.upcase : char.downcase
    end
    word_chars.join
  end
  words.join(' ')
end

def word_cap(string)
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a
  replacements = {}
  lower.each_with_index do |char, index|
    replacements[char] = upper[index]
  end

  words = string.split
  capitalized = []
  words.each do |word|
    capitalized_word = ''
    chars = word.chars
    index = 0
    loop do
      capitalized_word << if index.zero?
                            if replacements.values.include?(chars[index])
                              chars[index]
                            elsif replacements.keys.include?(chars[index])
                              replacements[chars[index]]
                            else
                              chars[index]
                            end
                          elsif index.positive?
                            if replacements.keys.include?(chars[index])
                              chars[index]
                            elsif replacements.values.include?(chars[index])
                              replacements.key(chars[index])
                            else
                              chars[index]
                            end
                          end
      index += 1
      break if index == chars.size
    end
    capitalized << capitalized_word
  end
  capitalized.join(' ')
end

# def word_cap(string)
#   words = string.split.map { |word| word.capitalize }
#   words.join(' ')
# end

# def word_cap(string)
#   string.split.map(&:capitalize).join(' ')
# end

# Examples

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
