# 1

# Given the array below

flintstones = ['Fred', 'Barney', 'Wilma', 'Betty', 'Pebbles', 'BamBam']

# Turn this array into a hash where the names are the keys and the values are the positions in the array.

hash_with_positions = {}
flintstones.each_with_index do |element, index|
  hash_with_positions[element] = index
end

p hash_with_positions



# 2

# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sum

total_age = 0
ages.each { |_name, age| total_age += age }
p total_age

p ages.values.inject(:+)



# 3

# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

ages.select! { |person, age| age < 100 }
p ages



# 4

# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

minimum_age = ages.values.first
ages.each do |person, age|
  if age < minimum_age
    minimum_age = age
  end
end
p minimum_age

p ages.values.min



# 5

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

counter = 0
index = loop do
          break if counter == flintstones.size

          if flintstones[counter][0..1] == 'Be'
            break counter
          end

          counter += 1
        end
puts index

index = nil
flintstones.each_with_index do |person, idx|
  if person[0..1] == 'Be'
    index = idx
    break
  end
end
puts index

puts flintstones.index { |name| name[0, 2] == 'Be' }



# 6

# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  name[0, 3]
end
p flintstones



# 7

# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

frequencies = Hash.new(0)
characters = statement.scan(/\S/)
characters.each_with_object(frequencies) do |char, hash|
  hash[char] += 1
end
p frequencies.sort_by { |char, freq| char }.to_h


result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency.positive?
end
p result.sort_by { |char, freq| char }.to_h



# 8

# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# element = 0
# 1
# [2, 3, 4]
# element = 1
# 3
# [3, 4]
# element = 2
# nil

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# element = 0
# 1
# [1, 2, 3]
# element = 1
# 2
# [1, 2]
# element = 3
# nil



# 9

# As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

words = 'the flintstones rock'

# would be:

# words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.

def titleize(string)
  words = string.split(' ')
  words.map! do |word|
    word.capitalize
  end
  words.join(' ')
end

titled = titleize(words)
puts titled

words = "the flintstones rock"
words.split(' ').map!(&:capitalize).join(' ')
puts words

words = "the flintstones rock"
puts words.split(' ').map { |word| word.capitalize }.join(' ')



# 10

# Given the munsters hash below

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female'}
}

# Modify the hash such that each member of the Munster family has an additional 'age_group' key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

# { 'Herman' => { 'age' => 32, 'gender' => 'male', 'age_group' => 'adult' },
#   'Lily' => {'age' => 30, 'gender' => 'female', 'age_group' => 'adult' },
#   'Grandpa' => { 'age' => 402, 'gender' => 'male', 'age_group' => 'senior' },
#   'Eddie' => { 'age' => 10, 'gender' => 'male', 'age_group' => 'kid' },
#   'Marilyn' => { 'age' => 23, 'gender' => 'female', 'age_group' => 'adult' } }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

# 1. determine age of person
# 2. determine age group of person
# 3. add age group of person to their details
# 4. repeat for each person

ages = []
munsters.each do |_name, details|
  ages << details['age']
end
# p ages
# [32, 30, 402, 10, 23]

age_groups = []
ages.each do |age|
  # if age >= 65
  #   age_group = 'senior'
  # elsif age >= 18
  #   age_group = 'adult'
  # else
  #   age_group = 'kid'
  # end

  age_group = case age
              when 0..17 then 'kid'
              when 18..64 then 'adult'
              when age >= 65 then 'senior'
              end
  age_groups << age_group
end
# p age_groups
# ["adult", "adult", "senior", "kid", "adult"]

munsters.each_with_index do |(_name, details), index|
  details['age_group'] = age_groups[index]
end
p munsters

# { 'Herman' => { 'age' => 32, 'gender' => 'male', 'age_group' => 'adult' },
#   'Lily' => { 'age' => 30, 'gender' => 'female', 'age_group' => 'adult' },
#   'Grandpa' => { 'age' => 402, 'gender' => 'male', 'age_group' => 'senior' },
#   'Eddie' => { 'age' => 10, 'gender' => 'male', 'age_group' => 'kid' },
#   'Marilyn' => { 'age' => 23, 'gender' => 'female', 'age_group' => 'adult' } }



munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female'}
}

munsters.each do |_name, details|
  age = details['age']
  age_group = case age
              when 0..17 then 'kid'
              when 18..64 then 'adult'
              when age >= 65 then 'senior'
              end
  details['age_group'] = age_group
end
p munsters
