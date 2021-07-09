# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

CONSONANT = %w(b c d f g h j k l m n p q r s t v w x y z)

def consonant?(char)
  CONSONANT.include?(char.downcase)
end

def double_consonants(string)
  result = ''
  string.each_char do |char|
    if consonant?(char)
      result << char * 2
    else
      result << char
    end
  end

  result
end

# Examples:
puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
