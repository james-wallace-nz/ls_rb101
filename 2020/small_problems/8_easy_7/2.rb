# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# input: string
# output: hash

LOWERCASE = 'a-z'
UPPERCASE = 'A-Z'

def letter_case_count(string)
  hash = {}
  hash[:lowercase] = string.count(LOWERCASE)
  hash[:uppercase] = string.count(UPPERCASE)
  hash[:neither] = string.count("^#{LOWERCASE}", "^#{UPPERCASE}")
  hash
end

# solutions

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  chars = string.chars
  counts[:lowercase] = chars.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = chars.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = chars.count { |char| char =~ /[^a-zA-Z]/ }
  counts
end

LOWER = ('a'..'z').to_a
UPPER = ('A'..'Z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  chars = string.chars
  chars.each do |char|
    if LOWER.include?(char)
      counts[:lowercase] += 1
    elsif UPPER.include?(char)
      counts[:uppercase] += 1
    else
      counts[:neither] += 1
    end
  end
  counts
end

# Examples

p letter_case_count('abCdef 123') # == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') # == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') # == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') # == { lowercase: 0, uppercase: 0, neither: 0 }
