# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

VOWELS = %w(a e i o u)

# input: array of strings
# output: array of strings with vowels removed



def remove_vowels(array)

end

# Example:
puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) # == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) # == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) # == ['BC', '', 'XYZ']
