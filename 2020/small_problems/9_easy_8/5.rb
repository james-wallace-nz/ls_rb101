# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def leading_substrings(string)
  substrings = []
  0.upto(string.size - 1) do |index|
    substrings << string[0..index]
  end
  substrings
end

def substrings(string)
  sub_substrings = []
  0.upto(string.size - 1) do |index|
    sub_substrings.concat(leading_substrings(string[index..-1]))
  end
  sub_substrings
end

def palindromes(string)
  substrings = substrings(string)
  substrings.select do |substring|
    substring == substring.reverse && substring.size != 1
  end
end

# Examples:

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

puts '-----'

# Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.

# assumption: delete or replace non-alphanumeric? => replace with space

def leading_substrings(string)
  substrings = []
  0.upto(string.size - 1) do |index|
    substrings << string[0..index]
  end
  substrings
end

def substrings(string)
  sub_substrings = []
  replaced_string = string.delete('^a-zA-Z0-9')
  # replaced_string = string.gsub(/[^a-z0-9]/i, ' ')
  0.upto(replaced_string.size - 1) do |index|
    sub_substrings.concat(leading_substrings(replaced_string[index..-1]))
  end
  sub_substrings
end

def palindromes(string)
  substrings = substrings(string)
  substrings.select do |substring|
    substring.downcase == substring.downcase.reverse && substring.size != 1
  end
end

p palindromes('AbcbA')== ["AbcbA", "bcb"]
p palindromes('AbcBa') == ["AbcBa", "bcB"]

p palindromes('hello-madam-did-madam-goodbye')== [
  'll', 'madam', 'madamdidmadam', 'ada',
  'adamdidmada', 'damdidmad', 'amdidma', 'mdidm', 'did',
  'madam', 'ada', 'oo'
]
