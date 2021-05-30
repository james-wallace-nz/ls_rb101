# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

INTEGER_WORDS = {
  0 => 'zero',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen'
}

def alphabetic_number_sort(array)
  words_and_integers = []
  array.each do |integer|
    words_and_integers << [INTEGER_WORDS[integer], integer]
  end
  sorted = words_and_integers.sort_by { |word, integer| word }
  sorted.map { |word, integer| integer }
end


NUMBER_WORDS = %w(zero one two three four five six seven eight
                  nine ten eleven twelve thirteen fourteen fifteen
                  sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(array)
  array.sort_by { |integer| NUMBER_WORDS[integer] }
end

# Examples:

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]


# Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?

# test = (0..19).to_a
# p test
# p alphabetic_number_sort(test)


# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
# => [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

# p test # with sort_by!
# => [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

# p test # with sort_by
# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]

# sort_by! mutates self so the original array would be mutated not just returned by the method.


# For an extra challenge, rewrite your method to use Enumerable#sort (unless you already did so).

def alphabetic_number_sort(array)
  array.sort { |a, b| NUMBER_WORDS[a] <=> NUMBER_WORDS[b] }
end

# Examples:

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
