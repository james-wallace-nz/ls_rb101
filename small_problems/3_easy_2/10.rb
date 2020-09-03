# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo']
# array2 = []
# array2 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo']
# array1 = ['Moe', 'Larry', 'CURLY', 'SHEMP', 'Harpo', 'CHICO', 'Groucho', 'Zeppo']
# array2 = ['Moe', 'Larry', 'CURLY', 'SHEMP', 'Harpo', 'CHICO', 'Groucho', 'Zeppo']

# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo

# While array1 and array2 are different arrays, their elements referecne the same string objects.
# Therefore, when array1 strings are mutated with upcase! the array2 references to those values also updates.

# Further Exploration
# How can this feature of ruby get you in trouble? How can you avoid it?

# This feature can get you into trouble if you mutate an object and have another variable referencing that object which you didn't mean to chage
# To avoid this, you could clone or dup each value in array1 when you pass them to array2

array1.each { |value| array2 << value.dup }
