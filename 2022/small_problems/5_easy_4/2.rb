# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# input: integer (year)
# outputs: string, century ending in st, nd, rd or th
# algo:
# 1. determine century
# 2. determine suffix
# 3. concatenate and return string

# century
# remainder after dividing by 100?

# endings:
# 1         'st'
# 2         'nd'
# 3         'rd'
# 4 - 10    'th'
# 11 - 13   'th'

def century(year)
  century = year / 100 + (year % 100 > 0 ? 1 : 0)
  "#{century}#{suffix(century)}"
end

def suffix(century)
  if [11, 12, 13].include?(century % 100)
    'th'
  else
    case century % 10
    when 0 then 'th'
    when 1 then 'st'
    when 2 then 'nd'
    when 3 then 'rd'
    when 4..9 then 'th'
    end
  end
end

# Examples:

puts century(2000) == '20th'


puts century(2001) == '21st'


puts century(1965) == '20th'


puts century(256) == '3rd'


puts century(5) == '1st'


puts century(10103) == '102nd'


puts century(1052) == '11th'


puts century(1127) == '12th'


puts century(11201) == '113th'
