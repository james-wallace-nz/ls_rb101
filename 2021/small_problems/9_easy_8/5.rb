# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

# input: string
# output: substrings that are palindromes
# algo:
# 1. extract all substrings into an array
# 2.a iterate over the array
# 2.b if substring is a palindrom add to palindromes array
# 3. return palindromes array

def leading_substrings(string)
  substrings = []

  0.upto(string.size - 1) do |index|
    substrings << string[0..index]
  end

  substrings
end

def substrings(string)
  substrings = []

  (0...string.size).each do |starting_index|
    substring = string[starting_index..-1]
    substrings << leading_substrings(substring)
  end

  substrings.flatten
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

def palindromes(string)
  palindromes = []

  substrings = substrings(string)

  substrings.each do |substring|
    palindromes << substring if palindrome?(substring)
  end

  palindromes
end

# Examples:
puts palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
