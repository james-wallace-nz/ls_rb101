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

# name and save_name reference the same string in memory, which is 'Bob'. When name is mutated with the upcase!
# method save_name still points to the same string so is also changed.
