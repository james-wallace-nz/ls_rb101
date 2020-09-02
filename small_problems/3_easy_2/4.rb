# Build a program that displays when the user will retire and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

print 'What is your age? '
current_age = gets.chomp.to_i

print 'At what age would you like to retire? '
retire_age = gets.chomp.to_i

remaining_work_years = retire_age - current_age
current_year = Time.now.year
retire_year = current_year + remaining_work_years

puts "It's #{year}. You will retire in #{retire_year}."
puts "You have only #{remaining_work_years} years of work to go!"
