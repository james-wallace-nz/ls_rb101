# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

def suffix(century)
  tens = century % 100
  ones = tens % 10
  if tens <= 20
    case tens
    when 1 then 'st'
    when 2 then 'nd'
    when 3 then 'rd'
    when 11 then 'th'
    when 12 then 'th'
    when 13 then 'th'
    else 'th'
    end
  else
    case ones
    when 1 then 'st'
    when 2 then 'nd'
    when 3 then 'rd'
    else 'th'
    end
  end
end

def century(year)
  century = (year.ceil(-2) / 100)
  suffix = suffix(century)
  "#{century}#{suffix}"
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

# 1st
# 2nd
# 3rd
# 4th - 20th
# 21st
# 22nd
# 23rd
# 24th - 30th
# 31st
# 32nd
# 33rd

# 2001.ceil(-2) / 100 = 2100
# % 100 = 21
# % 10 = 1

# 256.ceil(-2) / 100 = 3
# % 100 = 3
# % 10 = 3

# 5.ceil(-2) / 100 = 100
# % 100 = 1
# % 10 = 1

def century(year)
  century = year / 100 + 1
  puts century
  puts year % 100
  century -= 1 if year % 100 == 0
  puts century
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  puts century % 100
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10
  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

puts century(2000) == '20th'
puts '  '
puts century(2001) == '21st'
puts '  '
puts century(1965) == '20th'
puts '  '
puts century(256) == '3rd'
puts '  '
puts century(5) == '1st'
puts '  '
puts century(10103) == '102nd'
puts '  '
puts century(1052) == '11th'
puts '  '
puts century(1127) == '12th'
puts '  '
puts century(11201) == '113th'
