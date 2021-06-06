# Write a method that counts the number of occurrences of each element in a given array.

def count_occurrences(array)
  counts = Hash.new(0)
  array.each do |vehicle|
    counts[vehicle] += 1
  end
  counts.each do |vehicle, count|
    puts "#{vehicle} => #{count}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

puts count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

def count_occurrences(array)
  occurences = {}

  array.uniq.each do |vehicle|
    occurences[vehicle] = array.count(vehicle)
  end

  occurences.each do |vehicle, count|
    puts "#{vehicle} => #{count}"
  end
end

count_occurrences(vehicles)
