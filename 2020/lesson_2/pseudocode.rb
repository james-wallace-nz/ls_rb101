# a method that returns the sum of two integers

# Casual:

define method that accepts two parameters
add argument one and argument two
close the method definition

call method with two integers as arguments


# Formal:

START

define method with two parameters
  argument1 + argument2
end method definition

invoke method with two integer arguments

END


# a method that takes an array of strings, and returns a string that is all those strings concatenated together

# Casual:

define method with one parameters
  create string variable as an empty string
  iterate through each array element
  add array element + space to the end of the string
  return string variable
close method definition

call method and pass an array of strings as the argument


# Formal:

START

given an array of strings

define method with one parameters
  set string = ''
  iterate through each array element using #each method
    << array element to string with space
  end iteration
  return string variable
end method definition

invoke method with array of strings passed as the argument

END


# a method that takes an array of integers, and returns a new array with every other element

# Casual:

define method with one parameters
  create new empty array called every_other
  create new counter variable with value of 0
  loop through each element using counter
  for each element add to the every_other array if counter is odd
  return every_other array
end method definition

call method

# Formal:

START

given an array of integers

define a method that accepts the array as the parameters
  set every_other to empty array
  set counter to 0
  while counter < parameter size
    if parameter[counter].odd?
      every_other << parameter[counter]
    end
  end
  every_other
close the method

invoke the method and pass the array as an argument

END
