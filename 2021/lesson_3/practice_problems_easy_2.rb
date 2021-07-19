# 1)

# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.

# Bonus: What are two other hash methods that would work just as well for this solution?

puts ages['Spot'] == nil
ages.fetch('Spot') rescue puts 'false'
puts ages.keys.include?('Spot')
puts ages.has_key?('Spot')
puts ages.include?('Spot')
puts ages.member?('Spot')

puts '------'


# 2)

# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original munsters_description above):

munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase!
puts munsters_description == "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."


munsters_description = "The Munsters are creepy in a good way."
munsters_description.capitalize!
puts munsters_description == "The munsters are creepy in a good way."


munsters_description = "The Munsters are creepy in a good way."
munsters_description.downcase!
puts munsters_description == "the munsters are creepy in a good way."


munsters_description = "The Munsters are creepy in a good way."
munsters_description.upcase!
puts munsters_description == "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

puts '------'


# 3)

# We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
puts ages

puts '------'


# 4)

# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.include?('Dino')
puts advice.match?('Dino')
puts !!(advice =~ /[Dino]/)

puts '------'


# 5)

# Show an easier way to write this array

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

puts '------'


# 6)

flintstones << 'Dino'
flintstones += ['Dino']
flintstones.push('Dino')
flintstones.concat(['Dino'])
p flintstones

puts '------'


# 7)

flintstones.concat(['Dino', 'Hoppy'])
p flintstones

puts '------'


# 8)

# Shorten the following sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

# puts advice.slice!(0, 39)
puts advice.slice!(0, advice.index('house'))
puts advice

puts '------'

# As a bonus, what happens if you use the String#slice method instead?

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice(0, 39)
puts advice

puts '------'


# 9)

# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

puts statement.count('t')

puts '------'


# 10)

# Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a table of Flintstone family members that was forty characters in width, how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"
puts title.center(40)
