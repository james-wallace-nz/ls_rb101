# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# array2 = ['Moe', 'Larry', 'CURLY', 'SHEMP', 'Harpo', 'CHICO', 'Groucho', 'Zeppo']
# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo

# We iterate through array1 with the each method.
# We add each element in array1 to array2, which then contains a reference to the same string objects as array1.
# We iterate through array1 with the each method and mutate the element with upcase! if that element starts with 'C' or 'S'
# array2 elements reference the same values that were mutated so this is updated too.

# the first each loop simply copies a bunch of references from array1 to array2. When that first loop completes, both arrays not only contain the same values, they contain the same String objects. If you modify one of those Strings, that modification will show up in both Arrays.
