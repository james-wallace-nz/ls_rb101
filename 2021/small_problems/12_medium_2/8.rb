# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

# PROBLEM:

# Return the next 'featured number' that is greater than the argument.
# Return error if no next number found
# Featured number is an odd number that is a multiple of 7 and whose digits occur only once


# DATA STRUCTURE:


# ALGORITHM:

# Brute force:
# - increment from argument to next multiple of 7
# - check if valid featured number
#   - multiple of 7
#   - odd number
#   - digits only occur once
# - if valid return the number
# - otherwise increment by 7 and loop again
# - return `error` if count greater than 10_000_000_000

# CODE:

def digits_occur_once?(number)
  digits = number.to_s.chars
  # 10.times do |digit|
  #   return false if digits.any? { |char| digits.count(digit.to_s) > 1 }
  # end
  # true
  digits.uniq == digits
end

def featured_number?(number)
  (number % 7).zero? && number.odd? && digits_occur_once?(number)
end


def featured(start)
  number = start
  if (start % 7).zero?
    number += 7
  else
    7.times do |increment|
      number = start + increment
      break number if (number % 7).zero?
    end
  end

  loop do
    return number if featured_number?(number)
    number += 7
    break if number >= 10_000_000_000
  end

  'There is no possible number that fulfills those requirements'
end


# EXAMPLES:

# puts featured_number?(14)
# puts featured_number?(49)
# puts featured_number?(98)
# puts featured_number?(97)
# puts featured_number?(133)

puts featured(12) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(20) == 21
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999) == 'There is no possible number that fulfills those requirements'
