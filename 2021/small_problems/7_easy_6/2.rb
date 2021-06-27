# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

VOWELS = %w(a e i o u)

# input: array of strings
# output: array of strings with vowels removed

# algo:
# 1. iterate through array elements
# 2. delete vowels - lowercase and uppercase
# 3. return array of new strings

def remove_vowels(array)
  new_array = []
  array.each do |string|
    new_array << (string.delete "AEIOUaeiou")
  end
  new_array
end

# Example:
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
