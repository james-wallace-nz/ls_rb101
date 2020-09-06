# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# input: year integer
# output: string with number then suffix
# algorithm:
# 1. determine century
# 2. determine suffix
# 3. add century and suffix

def suffix(century)
  case century
  when 11..13 then return 'th'
  end

  case century % 100
  when 11..13 then return 'th'
  end

  digit = century.to_s[-1].to_i

  case digit
  when 0 then 'th'
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  when 4..9 then 'th'
  end
end

def century(year)
  cent = year / 100
  cent += 1 if (year % 100).positive?
  "#{cent}#{suffix(cent)}"
end

# Examples:

# puts century(2000)
# puts century(2001)
# puts century(1965)
# puts century(256)
# puts century(5)
# puts century(10103)
# puts century(1052)
# puts century(1127)
# puts century(11201)

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

puts century(1)       == '1st'
puts century(100)     == '1st'
puts century(101)     == '2nd'
puts century(133)     == '2nd'
puts century(245)     == '3rd'
puts century(1052)    == '11th'
puts century(1152)    == '12th'
puts century(1252)    == '13th'
puts century(2012)    == '21st'
puts century(2112)    == '22nd'
puts century(22222)   == '223rd'
puts century(22512)   == '226th'

#    1 -  100    1st

#  101 -  200    2nd

#  201 -  300    3rd

#  301 -  400    4th
#  401 -  500    5th
#  501 -  600    6th
#  601 -  700    7th
#  701 -  800    8th
#  801 -  900    9th

#  901 - 1000   10th

# 1001 - 1100   11th
# 1101 - 1200   12th
#               13th

#               14th
#               15th
#               16th
#               17th
#               18th
#               19th
#               20th

#               21st

#               22nd

#               23rd

#               24th
# ...
