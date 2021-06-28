# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def swapcase(string)
  swap_case_words = string.split
  swap_case_words.map do |word|
    word.chars.map do |char|
      if LOWERCASE.include?(char)
        char.upcase
      elsif UPPERCASE.include?(char)
        char.downcase
      else
        char
      end
    end.join
  end.join(' ')
end

# Example:
puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
