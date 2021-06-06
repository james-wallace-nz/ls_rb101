# Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
# What does this code print out? Think about it for a moment before continuing.

# Alice
# Bob

# If you said that code printed

# Alice
# Bob
# you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
# What does this print out? Can you explain these results?

# BOB
# BOB
both name and save_name are assigned to the same string object 'Bob'
name.upcase! mutates the string object referenced by name and changes each character to capital case
save_name still points to the same string object that was mutated
