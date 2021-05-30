# Write a method that counts the number of occurrences of each element in a given array.

# input: array of case-sensitive words
# output: display word and frequency
# data-structure: hash
# algorithm: loop through array and increment value for each key

def count_occurrences(array)
  frequencies = Hash.new(0)
  array.each do |item|
    frequencies[item] += 1
  end

  frequencies.each do |word, frequency|
    puts "#{word} => #{frequency}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2


# Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".


def count_occurrences(array)
  frequencies = Hash.new(0)
  array.each do |item|
    frequencies[item.downcase] += 1
  end

  frequencies.each do |word, frequency|
    puts "#{word} => #{frequency}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)


# solution:

def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end
