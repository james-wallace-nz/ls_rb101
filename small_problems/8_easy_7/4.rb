# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# input: string
# output: new string

def swapcase(string)
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a
  upper_lower = upper.zip(lower).to_h

  new_string = ''
  string.chars.each do |char|
    if upper_lower.keys.include?(char)
      new_string << upper_lower[char]
    elsif upper_lower.values.include?(char)
      new_string << upper_lower.key(char)
    else
      new_string << char
    end
  end
  new_string
end

# solution

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

# Example:

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
