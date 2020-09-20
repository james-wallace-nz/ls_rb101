# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def double_consonants(string)
  new_string = ''
  string.each_char do |char|
    if char =~ /[^aeiou_\d\W\s]/i
      new_string << char << char
    else
      new_string << char
    end
  end
  new_string
end

# Examples:

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
p double_consonants("July_4th") == "JJullyy_4tthh"
