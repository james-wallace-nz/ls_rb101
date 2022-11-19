# Outer scope variables can be accessed by inner scope
a = 1
loop do
  puts a
  # 1
  a = a + 1
  break
end

puts a
# 2


# Inner scope variables cannot be accessed in outer scope
loop do
  b = 1
  break
end

puts b
# NameError: undefined local variable or method 'b'


# Peer scopes do not conflict
2.times do
  a = 'hi'
  puts a
  # hi
end

loop do
  puts a
  # NameError: undefined local variable or method 'a'
  break
end

puts a
# NameError: undefined local variable or method 'a'


# Nested blocks
a = 1

loop do
  b = 2

  loop do
    c = 3
    puts a
    # 1
    puts b
    # 2
    puts c
    # 3
    break
  end

  puts a
  # 1
  puts b
  # 2
  puts c
  # NameError: undefined local variable or method 'c'
  break
end

puts a
# 1
puts b
# NameError: undefined local variable or method 'b'
puts c
# NameError: undefined local variable or method 'c'


# Variable Shadowing
# prevents access to the outer scope local variable
n = 10

[1, 2, 3].each do |n|
  puts n
end
# 1
# 2
# 3

# variable shadowing also prevents us frmo making changes to the outer scoped 'n'

1.times do |n|
  n = 11
end
puts n
# 10


# Method can only access variables that were initialized inside the method or that are defined as parameters

# A method definition can't access local variables in another scope

a = 'hi'

def some_method
  puts a
end

some_method
# NameError: undefined local variable or method 'a'


# A method definition can access objects passed in

def some_method(a)
  puts a
end

some_method(5)
# 5


# local variable and method sharing the same name:
# Ruby will first search for the local variable and if it is not found, Ruby tries to find a method with the given name
# If neither is found, a NameError is thrown

hello = 'hi'

def hello
  'Saying hello!'
end

puts hello
'hi'


# Rules of scope for a method invocation with a block remain when inside a method definition

def some_method
  a = 1
  5.times do
    puts a
    # 1
    b = 2
  end

  puts a
  # 1
  puts b
  # NameError
end

some_method


# Constants behave like globals
USERNAME = 'Batman'

def authenticate
  puts "Logging in as #{USERNAME}"
end

authenticate

FAVORITE_COLOR = 'taupe'

1.times do
  puts "I love #{FAVORITE_COLOR}!"
end

loop do
  MY_TEAM = 'Pheonix Suns'
  break
end

puts MY_TEAM

# Constants are said to have lexical scope