# Assume you have the following code:

require 'date'

puts Date.civil
puts Date.civil(2016)
puts Date.civil(2016, 5)
puts Date.civil(2016, 5, 13)

# Date::civil([year=-4712[, month=1[,mday=1[,start=Date::ITALY]]]]) -> date
# Creates a date object denoting the given calendar date

# In this class, BCE years are counted astronomically. Thus, the year before the year 1 is the year zero, and the year preceding the year zero is the year -1. The month and the day of month should be a negative or a positive number (as a relative month/day from the end of year/month when negative). They should not be zero.

# The last argument should be a Julian day number which denotes the day of calendar reform. Date::ITALY (2299161=1582-10-15), Date::ENGLAND (2361222=1752-09-14), Date::GREGORIAN (the proleptic Gregorian calendar) and Date::JULIAN (the proleptic Julian calendar) can be specified as a day of calendar reform.

# -4712-01-01
# 2016-01-01
# 2016-05-01
# 2016-05-13
