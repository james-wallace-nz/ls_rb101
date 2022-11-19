require 'date'

# https://ruby-doc.org/stdlib-2.7.4/libdoc/date/rdoc/Date.html#method-c-civil

# will return a date object.

puts Date.civil
# -4712-01-01

puts Date.civil(2016)
# 2016-01-01

puts Date.civil(2016, 5)
# 2016-05-01

puts Date.civil(2016, 5, 13)
# 2016-05-13

