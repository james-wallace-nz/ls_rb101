require 'date'

# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

# PROBLEM:

# Return the number of Friday the 13ths in the year passed in as an argument
# Year is greater than 1752


# DATA STRUCTURES:

# Integer year



# ALGORITHM:

# - iterate through every month with day 13th in `year` passed in as an argument
# - increment `fridays_count` by `1` if day is a Friday
# - return `fridays_count`

# CODE:

def friday_13th(year)
  fridays_count = 0
  12.times do |months_adjustment|
    date = Date.new(year, 1 + months_adjustment, 13)
    fridays_count += 1 if date.friday?
  end
fridays_count
end

# Examples:

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
