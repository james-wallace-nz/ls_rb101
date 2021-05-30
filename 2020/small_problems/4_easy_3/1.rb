# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

# - string number into a string:
#   - 1: st
#   - 2: nd
#   - 3: rd
#   - 4-20: th
#   - 21: st
#   - 22: nd
#   - 23: rd
#   - 24-30: th
#   ...
#   - generalise:
#     - century_number % 10
#       - 1, 2, 3: st, nd, rd
#       - 0, 4-9: th
#     - except for 11, 12, 13

#  1st
#  2nd
#  3rd

#  4th
#  5th
#  6th
#  7th
#  8th
#  9th

# 10th
# 11th
# 12th
# 13th

# 14th
# 15th
# 16th
# 17th
# 18th
# 19th
# 20th

# 21st
# 22nd
# 23rd

# 24th
# 25th

# input: 6 integers
# output: string - 'The number [number] [appears / does not appear] in [array of first 5 integers]'
# algorithm:
# 1. loop through 5 x and ask for integer
  # 1a work out suffix for number request (st, nd, rd, th)
# 2. add each integer to an array
# 3. ask for integer 6 and set target variable
# 4. check whether array includes target

def suffix(digits)
  case digits
  when 0 then 'th'
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  when 4..9 then 'th'
  when 11 then 'th'
  when 12 then 'th'
  when 13 then 'th'
  end
end

def append(number)
  last_digits = case number
                when 11 then 11
                when 12 then 12
                when 13 then 13
                else
                  number.to_s[-1].to_i
                end

    suffix(last_digits)
end

array = []
5.times do |index|
  suffix = append(index + 1)
  puts "Enter the #{index + 1}#{suffix} number:"
  array << gets.chomp.to_i
end

puts 'Enter the last number:'
number = gets.chomp.to_i

if array.include?(number)
  puts "The number #{number} appears in #{array}"
else
  puts "The number #{number} does not appear in #{array}"
end
