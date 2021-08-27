# A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

# 1  5  8
# 4  7  2
# 3  9  6

# can be described by the Array of Arrays:

matrix = [
          [1, 5, 8],
          [4, 7, 2],
          [3, 9, 6]
        ]

# The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

# 1  4  3
# 5  7  9
# 8  2  6

# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix.

# Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.


# PROBLEM

# Transpose a 3x3 array so that columns become rows

# Input: array
# Output: new array


# DATA STRUCTURE

# Integers
# Array


# ALGORITHM

# - Duplicate matrix
# - iterate through original and update values in new array

    # row, column = column, row
#   0, 0 = 0, 0
#   0, 1 = 1, 0
#   0, 2 = 2, 0

#   1, 0 = 0, 1
#   1, 1 = 1, 1
#   1, 2 = 2, 1

#   2, 0 = 0, 2
#   2, 1 = 1, 2
#   2, 2 = 2, 2

#   - iterate through each row/column combination
#   - swap row and column from original to new_array

#   - each outer loop (row)

#     - each outer loop (column)
#       new_array[row, column] = original[column, row]

#   - return new_array


# CODE


def transpose(matrix)
  transposed = [[], [], []]

  matrix.each_with_index do |row, row_index|
    row.each_index do |column_index|
      transposed[column_index][row_index] = row[column_index]
    end
  end

  transposed
end


def transpose(matrix)
  result = []

  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index|
      matrix[row_index][column_index] }
    result << new_row
  end

  result
end



# Examples

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# new_matrix = [
#   [1, 4, 3],
#   [5, 7, 9],
#   [8, 2, 6]
# ]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
