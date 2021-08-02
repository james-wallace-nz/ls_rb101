# 1.

# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones_hash = {}

flintstones.each_with_index do |value, index|
  flintstones_hash[value] = index
end

# p flintstones_hash


# 2.

# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total = 0
ages.each do |_, age|
  total += age
end
# puts total

total = ages.reduce(0) do |sum, (_, age)|
  sum + age
end

# puts total

# puts ages.values.reduce(&:+)

# puts ages.values.sum


# 3.

# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

ages.delete_if { |_, age| age >= 100 }
# p ages


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if { |_, age| age < 100 }
# p ages


# 4.

# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# minimum = nil
# ages.each do |_, age|
#   minimum ||= age
#   if age < minimum
#     minimum = age
#   end
# end

# puts minimum

minimum = ages.values.reduce do |age, min|
  age < min ? age : min
end

# p minimum

# puts ages.values.min


# 5.

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

# puts flintstones.find_index { |name| name[0..1] == 'Be' }

# puts flintstones.index { |name| name[0, 2] == 'Be' }


# 6.

# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }
# p flintstones


# 7.

# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

frequency = Hash.new(0)
statement.chars.each do |char|
  frequency[char] += 1
end
# p frequency

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  frequency = statement.scan(letter).count
  result[letter] = frequency if frequency > 0
end
# p result


# 8.

# What happens when we modify an array while we are iterating over it? What would be output by this code?

# numbers = [1, 2, 3, 4]

# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# outputs `1`
# `numbers.shift(1)` returns `[1]`

# array is now `[2, 3, 4]`
# outputs `3`
# `numbers.shift(1)` returns `[2]`

# array is now `[3, 4]`
# `each` returns `[3, 4]`


# What would be output by this code?

# numbers = [1, 2, 3, 4]

# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# outputs `1`
# `numbers.pop(1)` destructively removes last element `4` and returns `4`
# array is now [1, 2, 3]

# outputs `2`
# `numbers.pop(1)` destructively removes last element `3` and returns `3`
# array is now [1, 2]/
# each stops iterating and returns [1, 2]


# 9.

# As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"

# would be:

# words = "The Flintstones Rock"

# Write your own version of the rails titleize implementation.


# p words.split.map { |word| word.capitalize }.join(' ')


def titleize(string)
  words = string.split
  words.map! do |word|
    word.capitalize
  end
  words.join(' ')
end

title = titleize(words)
# p title


# 10.

# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

updated = { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

munsters.each do |_, details|
  age_group = case details["age"]
              when  (0..17) then 'kid'
              when (18..64) then 'adult'
              else 'senior'
              end
  details['age_group'] = age_group
end

puts munsters == updated
