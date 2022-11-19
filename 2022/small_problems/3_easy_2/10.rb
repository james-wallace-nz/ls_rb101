# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []

array1.each { |value| array2 << value }
# array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo']
# array2 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo']

array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# array1 = ['Moe', 'Larry', 'CURLY', 'SHEMP', 'Harpo', 'CHICO', 'Groucho', 'Zeppo']
# array2 = ['Moe', 'Larry', 'CURLY', 'SHEMP', 'Harpo', 'CHICO', 'Groucho', 'Zeppo']

puts array2
# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo

# The elements in array2 have the same references to string values as the elements in array1.
# When the element in array1 are mutated by the upcase! method call, array2 still references the same changed string values.
