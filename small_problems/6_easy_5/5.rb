# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

def cleanup(string)
  string.gsub(/\W+/, ' ')
end

ALPHABET = ('a'..'z').to_a

def cleanup(string)
  chars = string.chars
  chars.map! do |char|
    ALPHABET.include?(char) ? char : ' '
  end
  chars.join('').squeeze(' ')
end

def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

# Examples:

p cleanup("---what's my +*& line?") == ' what s my line '
