# Write a method that counts the number of occurrences of each element in a given array.

def count_occurrences(words)
  word_counts = Hash.new(0)
  words.each do |word|
    word_counts[word] += 1
  end
  word_counts.each do |word, count|
    puts "#{word} => #{count}"
  end
end

def count_occurrences_case_insensitive(words)
  word_counts = Hash.new(0)
  lowercase_words = words.map { |word| word.downcase }
  lowercase_words.each do |word|
    word_counts[word] += 1
  end
  word_counts.each do |word, count|
    puts "#{word} => #{count}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv'
]

count_occurrences(vehicles)
puts '---'
count_occurrences_case_insensitive(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2