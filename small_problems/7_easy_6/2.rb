# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

VOWELS = %w(a e i o u)

def remove_vowels(array)
  removed_vowels = []
  array.each do |word|
    cleaned_word = ''
    word.chars.each do |char|
      cleaned_word << char unless VOWELS.include?(char.downcase)
    end
    removed_vowels << cleaned_word
  end
  removed_vowels
end

# Example:

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

puts '---'

# solution

def remove_vowels(array)
  array.map { |word| word.delete('aeiouAEIOU') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
