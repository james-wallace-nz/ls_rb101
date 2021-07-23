# Imagine a sequence of consecutive even integers beginning with 2.
# The integers are grouped in rows, with the first row containing one integer, the second row containing two integers, and so on.
# Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.


# 1. Understanding the Problem

# Input:
# - integer - identifies the row, a subset of a sequence of integers, which should be summed

# Output:
# - new integer - the sum of all integers on the input row

# Explicit requirements:
# - sequence of even integers
# - integers are consecutive
# - sequence is grouped into rows
# - each row incrementally larger 1, 2, 3 elements
# - row number equals the number of elements in the row

# Implicit requirements:
# - must create the sequence of numbers in the structure provided
# - input integer must be greater or equal to 1


# Create a row:
# Rules:
# - row is an array
# - arrays contain integers
# - integers are consecutive even numbers
# - integers in each row form part of an overall larger sequence
# - rows are of different lengths
# - Input: information required to create the output:
#   - starting integer
#   - length of the row
# - Output: the row itself e.g. [8, 10, 12]



# 2. Examples and Test Cases

# Sequence:
# - 2, 4, 6, 8, 10, 12, 14, 16, 18, 20

# Sequence structure:
# 2
# 4, 6
# 8, 10, 12
# 14, 16, 18, 20

# method(1)
# => row 1 is 2 => sum is 2

# method(2)
# => row 2 is 4, 6 => sum is 10

# method(3)
# => row 3 is 8, 10, 12 => sum is 30

# method(4)
# => row 4 is 14, 16, 18, 20 => sum is 68


# sum_even_number_rows(2)
# 2 => [
#   [2],
#   [4, 6]
# ]


# 3. Data Structures

# Overall strucutre representing sequence as a whole
# Individual rows within the overall structure
# Individual rows in a set order in context of sequence
# Individual rows contain integers
# Can assume that integers are in a set order in the context of the sequence

# Nested Array is logical structure

# [
#   [2],
#   [4, 6],
#   [8, 10, 12],
#   [14, 16, 18, 20]
# ]


# 4. Algorithms

# 1. Create an empty 'rows' array to contain all of the sum_even_number_rows
# 2. Create a 'row' array and add it to the overall 'rows' array
# 3. Repeate step 2 until all the necessary rows have been created
# 4. Sum the final row
# 4. Return the sum


# Sum even number rows method:
# 1. create a sequence starting with 2 in a nested array structure
# 2. locate the integer input row (last element) from the nested array returned by create_sequence method
# 3. sum the integers on that row
# 4. output the sum

# Create a sequence method:
# 1. create empty `rows` array
# 2. add row array of consecutive integers using starting integer and row length
# 3. repeat step 2 until number of rows equals integer input
# 4. return nested array


# Calculating the start integer:
# Rule: first integer of row == last integer of preceding row + 2
# Algorithm:
# - get the preceding row (last row in rows array)
# - get last integer of that row
# - add 2 to the integer


# Create row method:
# 1. create empty `row` '[]' array
# 2. add starting integer to `row` array
# 3. increment the integer by 2
# 4. repeat steps 2 and 3 until number of elements in the row array equals row number
      # - start the loop
      #   - add the start integer to the row
      #   - increment the start integer by 2
      #   - break out of the loop if length of row equals row_length
# 5. return the row



# 5. Implementing a solution in Code

def sum_even_number_rows(rows)
  sequence = create_sequence(rows)
  sequence.last.sum
end

def create_sequence(rows)
  result = []
  start_integer = 2
  (1..rows).each do |row|
    result.push(create_row(start_integer, row))
    start_integer = result.last.last + 2
  end
  result
end

def create_row(starting_integer, row_length)
  row = []
  integer = starting_integer
  row_length.times do
    row.push(integer)
    integer += 2
  end
  row
end

puts sum_even_number_rows(1) == 2
puts sum_even_number_rows(2) == 10
puts sum_even_number_rows(3) == 30
puts sum_even_number_rows(4) == 68
puts sum_even_number_rows(100)

p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]
