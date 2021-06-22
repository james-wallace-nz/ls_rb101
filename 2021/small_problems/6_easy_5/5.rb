# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# input: string containing lowercase letters and non-alphanumeric characters
# output: string with all non-alphabetic characters replaced by spaces. Multiply non-alphabetic characters = one space

# 1. split string into characters including spaces (.chars)
# 2. iterate through characters
#   a) if character is non-LETTERS character then b) otherwise character
#   b) if prior element is ' ' then '' otherwise ' '
# 3. join without spaces

LETTERS = ('a'..'z').to_a

def cleanup(string)
  chars = string.chars
  fixed_chars = []
  chars.each do |char|
    if LETTERS.include?(char)
      fixed_chars << char
    elsif fixed_chars[-1] != ' '
      fixed_chars << ' '
    end
  end
  fixed_chars.join
end

# Examples:
puts cleanup("---what's my +*& line?") == ' what s my line '


def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '
