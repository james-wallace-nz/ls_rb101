# Question 1

# Every object in Ruby has access to a method called object_id, which returns a numerical value that uniquely identifies the object. This method can be used to determine whether two variables are pointing to the same object.

# Take a look at the following code and predict the output:

a = "forty two"
b = "forty two"
c = a

puts a.object_id # 1
puts b.object_id # 2
puts c.object_id # 1



# Question 2

# Let's take a look at another example with a small difference in the code:

a = 42
b = 42
c = a

puts a.object_id # 1
puts b.object_id # 1
puts c.object_id # 1



# Question 3

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
# "My string looks like this now: pumpkins"

puts "My array looks like this now: #{my_array}"
# "My array looks like this now: ["pumpkins", "rutabaga"]"



# Question 4

# To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# My string looks like this now: "pumpkinsrutabaga
puts "My array looks like this now: #{my_array}"
# My array looks like this now: ["pumpkins"]



# Question 5

# Depending on a method to modify its arguments can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  [a_string_param, an_array_param]
  # return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Whether the above "coincidentally" does what we think we wanted depends upon what is going on inside the method.

# How can we change this code to make the result easier to predict and easier for the next programmer to maintain? That is, the resulting method should not mutate either argument, but my_string should be set to 'pumpkinsrutabaga' and my_array should be set to ['pumpkins', 'rutabaga']



# Question 6

# How could the following method be simplified without changing its return value?

def color_valid(color)
  # if color == "blue" || color == "green"
  #   true
  # else
  #   false
  # end
  color == "blue" || color == "green"
end
