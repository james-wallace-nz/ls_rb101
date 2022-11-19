# A block is part of the method invocation
# method invocation followed by { } or do..end is the way we define a block in Ruby. It is part of the method invocation.
# The block acts as an argument to the method
# The way an argument is used depends on how the method is defined

# block not executed

def greetings
  puts "Goodbye"
end

word = 'Hello'

greetings do
  puts word
end


# block executed

def greetings
  yield
  puts 'Goodbye'
end

word = 'Hello'

greetings do
  puts word
end

# Hello
# Goodbye


# A method can use the return value of the block to perform some other action


# Method definitions cannot directly access local variables initialized outside of the mehtod definition
# Nor can local variables initialized outside of the mehtod definition be reassigned from within it

# A block can access local variables initialized outside of the block and can reassign those variables.

# Methods can access local variables passed in as arguments.
# Methods can access local variables through interaction with blocks

# We can think of method definition as setting a certain scope for any local variabels in terms of the parameters that the method definition has, what it does with those parameters, and also how it interacts with a block

# We can think of method invocation as using the scope set by the method definition. If the method is defined to use a block, then the scope of the block can provide additional flexibility in terms of how the method invocation interacts with its surroundings.size
