# A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

# 1  5  8
# 4  7  2
# 3  9  6

# can be described by the Array of Arrays:

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
# An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.

# To access an element in matrix, you use Array#[] with both the row index and column index. So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9. An entire row in the matrix can be referenced by just using one index: matrix[1] is the row (an Array) [4, 7, 2]. Unfortunately, there's no convenient notation for accessing an entire column.

# The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

# 1  4  3
# 5  7  9
# 8  2  6

# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

# input: nested array
# output: transposed array

# [
#   [0, 1, 2],
#   [3, 4, 5],
#   [6, 7, 8]
# ]

# [
#   [0, 3, 6],
#   [1, 4, 7],
#   [2, 5, 8]
# ]

# 0, 0
# 1, 0
# 2, 0

#     # 0, 1
# 1, 1
# 2, 1

#     # 0, 2
#     # 1, 2
# 2, 2


# algorithm:
# loop columns: 0 - 2
# loop rows: 0 - 1

def transpose(matrix)
  size = matrix.size - 1
  transposed = []
  0.upto(size) do |column|
    new_row = []
    0.upto(size) do |row|
      new_row << matrix[row][column]
    end
    transposed << new_row
  end
  transposed
end

# solution

def transpose(matrix)
  result = []
  (0..2).each do |column|
    new_row = (0..2).map { |row| matrix[row][column] }
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

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# This program should print "true" twice.

# Write a transpose! method that transposes a matrix in place. The obvious solution is to reuse transpose from above, then copy the results back into the array specified by the argument. For this method, don't use this approach; write a method from scratch that does the in-place transpose.

def transpose!(matrix)
  size = matrix.size - 1

  combinations = []
  (0..size).each do |first|
    (0..size).each do |second|
      combinations << [first, second]
    end
  end
  combinations.map!(&:sort).uniq!

  combinations.each do |a, b|
    row = matrix[a][b]
    column = matrix[b][a]
    matrix[b][a] = row
    matrix[a][b] = column
  end
  matrix
end

# solution

def transpose!(matrix)
  size = matrix.size - 1
  (0..size).each do |i|
    i.upto(size).each do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end
  matrix
end

# column_index = 0
# row_index = 1

# row = 4
# column = 5

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == new_matrix
