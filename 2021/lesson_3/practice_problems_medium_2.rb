# 1.

# Every named entity in Ruby has an object_id. This is a unique identifier for that object.

# It is often the case that two different things "look the same", but they can be different objects. The "under the hood" object referred to by a particular named-variable can change depending on what is done to that named-variable.

# In other words, in Ruby, all values are objects...but they are not always the same object.

# Predict how the values and object ids will change throughout the flow of the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."          #   42            1234
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."          #   "forty two"   1345
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."          #   [42]          1456
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."          #   42            1234
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."  # 1234    1234
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."  # 1345    1345
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."  # 1456    1456
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block." #  1234    1234
    puts

    a_outer = 122                                                                      #   re-assigned
    b_outer = "thirty three"                                                           #   re-assigned
    c_outer = [44]                                                                     #   re-assigned
    d_outer = c_outer[0]                                                               #   re-assigned

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."   # 122                 1234    2234
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."   # "thirty three"      1345    2345
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."   # [44]                1456    2456
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."   # 44                  1234    2567
    puts


    a_inner = a_outer                                                                 #   initialistion
    b_inner = b_outer                                                                 #   initialistion
    c_inner = c_outer                                                                 #   initialistion
    d_inner = c_inner[0]                                                              #   initialistion

    a_inner_id = a_inner.object_id                                                    #  2234
    b_inner_id = b_inner.object_id                                                    #  2345
    c_inner_id = c_inner.object_id                                                    #  2456
    d_inner_id = d_inner.object_id                                                    #  2657

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."   # 122                 2234    2234
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."   # "thirty three"      2345    2345
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."   # [44]                2456    2456
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."   # [44]                2567    2567
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."                  # 122                1234    2234
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."                  # "thirty three"     1345    2345
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."                  # [44]               1456    2456
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."                  # 44                 1234    2567
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"              # "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"              # "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"              # "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"              # "ugh ohhhhh"
end


# Ruby re-used the object_id when the value was the same
# Ruby does not change the object_id between outside and inside the block
# Re-assigning the variables forced Ruby to create new objects and refer to them with the original variable names

# Outside the block has no access to variables defined within the block


# 2.

# Let's look at object id's again from the perspective of a method call instead of a block.

# Here we haven't changed ANY of the code outside or inside of the block/method. We simply took the contents of the block from the previous practice problem and moved it to a method, to which we are passing all of our outer variables.

# Predict how the values and object ids will change throughout the flow of the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."                               #  42            1234
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."                               #  "forty two"   1345
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."                               #  [42]          1456
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."                               #  42            1234
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."     # 42              1234    1234
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."     #{ }"forty two"   1345    1345
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."     # [42]            1456    1456
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."     # 42              1234    1234
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."    # 1234    1234
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."    # 1345    1345
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."    # 1456    1456
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."    # 1234    1234
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."     # 22                1234    2234
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."     # "thirty three"    1345    2345
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."     # [44]              1456    2456
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."     # 44                1234    2567
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."       # 22                2234    2234
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."       # "thirty three"    2345    2345
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."       # [44]              2456    2456
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."       # 44                2567    2567
  puts
end

# Inside the method, the parameter variables simply re-use the objects and object_ids
# When we re-assign the values of our outer variables Ruby uses new objects for these variables to deal with their new values

# Even though we changed the values for our "outer" variables inside the method call, we still have the same values and the same object ids after the method call.
# This is because our method accepts values as arguments. The names we give to those values in the definition of our method are separate from any other use of those same names
# The method gets the values of the arguments we pass, but the parameter variables inside the method have no other relationship to those outside of the method

# Our main method has no access to variables that are defined inside the method


# 3.

# Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# tricky_method is called with my_string and my_array as arguments
# Inside the method call, the a_string_param parameter is reassigned to the value of itself + "rutabaga", which is "pumpkinsrutabaga"
# my_string and a_string_param now reference different string objects

# also within the method call, an_array_param is concatentated with "rutabaga". `<<` is destructive in that it mutates the array object and adds a new element
# both my_array outside the method call, and an_array_param within the method call still reference the same, updated array object ['pumpkins', 'rutabaga']


# Therefore, the output of the method call will be:
# My string looks like this now: pumpkinsrutabaga"
# My array looks like this now: ["pumpkins", "rutabaga"]

# Ruby passes the arguments 'by value', but the value that gets passed is a reference to the objects
# The string argument is passed to the method as a reference to an object of type String
# The array is passed to the method as a reference to an object of type Array

# While a reference is passed, the method initializes a new local variable for both the string and the array and assigns each reference to the new local variables.
# These are variables that only live within the scope of the method definiiton

# The String#+= method is re-assignment and creates a new string object. The reference to this new object is assigned to a_string_param. The local variable a_string_param now points to 'pumpkinsrutabaga' not 'pumpkins'
# It has been assigned by the string#+= operation. this means that a_string_param and my_string no longer point to the same object

# One Array object can have any number of elements. When we attach an additional element to an array using the `<<` operation, Ruby simply keeps using the same object that was passed in and appends the new element to it
# Because the local variable `an_array_param` still points to the original object, the local variables my_array and an_array_param are still pointing to the same object



# 4.

# To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ['pumpkins']

# Within the Array#= assignment our literal `['pumpkins', 'rutabaga']` array is a new object and we are assigning it to the local variable `an_array_param`


# 5.

# Depending on a method to modify its arguments can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.

# How can we change this code to make the result easier to predict and easier for the next programmer to maintain?






# 6

# How could the following method be simplified without changing its return value?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end


def color_valid(color)
  color == "blue" || color == "green"
end

puts color_valid('blue')
puts color_valid('green')
puts color_valid('red')
