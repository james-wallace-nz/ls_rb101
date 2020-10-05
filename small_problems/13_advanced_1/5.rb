# As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:

# 1  5  8
# 4  7  2
# 3  9  6

# can be described by the Array of Arrays:

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:

# 3  4  1
# 9  7  5
# 6  2  8

# A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

# 3  4  1
# 9  7  5
# is:

# 9  3
# 7  4
# 5  1

# Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

# inputs: nested array matrix
# ouput: matrix rotated 90 degrees clockwise

# algorithim:
# 1. set num_of_columns, num_of_rows, result = empty array
# 2. loop 0 to num_of_columns exclusive
# 3. loop 0 to num_of_rows exclusive
# 4. new

def rotate90(matrix)
  num_of_columns = matrix.first.size
  num_of_rows = matrix.size
  result = []

  (0...num_of_columns).each do |col_index|
    new_row = []
    (num_of_rows - 1).downto(0) do |row_index|
      new_row << matrix[row_index][col_index]
    end
    result << new_row
  end
  result
end

# solution:

def rotate90(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size

  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map do |row_index|
      matrix[row_index][column_index]
    end
    result << new_row.reverse
  end
  result
end

# Examples

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

p new_matrix1 = rotate90(matrix1)

# [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# [
#   [3, 4, 1],
#   [9, 7, 5],
#   [6, 2, 8]
# ]

# matrix[col][row]

# col, row  => row,
# 0,0       => 0,2
# 0,1       => 1,2
# 0,2       => 2,2

# 1,0       => 0,1
# 1,1       => 1,1
# 1,2       => 2,1

# 2,0       => 0,0
# 2,1       => 1,0
# 2,2       => 2,0

# 0,0 0,1 0,2
# 1,0 1,1 1,2
# 2,0 2,1 2,2

# 2,0 1,0 0,0
# 2,1 1,1 0,1
# 2,2 1,2 0,2

# col = row
# row = columns - 1 - col   (3 - 1 - 0 == 2, 3 - 1 - 1 == 1, 3 - 1 - 2 == 0)

p new_matrix2 = rotate90(matrix2)

# [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# [
#   [5, 3],
#   [1, 7],
#   [0, 4],
#   [8, 2]
# ]

# 0,0   => 0,1
# 0,1   => 1,1
# 0,2   => 2,1
# 0,3   => 3,1

# 1,0   => 0,0
# 1,1   => 1,0
# 1,2   => 2,0
# 1,3   => 3,0

# 0,0 0,1 0,2 0,3
# 1,0 1,1 1,2 1,3

# 1,0 0,0
# 1,1 0,1
# 1,2 0,2
# 1,3 0,3

# 4 = 0 - 3
# 2 = 0 - 1

# 0,0 0,1 0,2 0,3
# 1,0 1,1 1,2 1,3

# 0,0 0,1
# 1,0 1,1
# 2,0 2,1
# 3,0 3,1

# columns = 0..3
# rows = 0..1


# count up columns 0 1 2 3
# count down rows 1 0
# matrix[row][col]


p new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# This program should print "true" three times.

puts '---'

# Can you modify your solution to perform 90, 180, 270, and 360 degree rotations based on an argument?

def rotate(matrix, degrees)
  result = matrix
  turns = degrees / 90

  turns.times do
    number_of_rows = result.size
    number_of_columns = result.first.size
    turned_matrix = []

    (0...number_of_columns).each do |column_index|
      new_row = (0...number_of_rows).map do |row_index|
        result[row_index][column_index]
      end
      turned_matrix << new_row.reverse
    end
    result = turned_matrix
  end
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# [
#   [5, 3],
#   [1, 7],
#   [0, 4],
#   [8, 2]
# ]

# [
#   [8, 0, 1, 5],
#   [2, 4, 7, 3]
# ]

# [
#   [2, 8],
#   [4, 0],
#   [7, 1],
#   [3, 5]
# ]

p rotate(matrix1, 180) == [[6, 9, 3], [2, 7, 4], [8, 5, 1]]

p rotate(matrix1, 90) == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]

p rotate(matrix2, 270) == [[2, 8], [4, 0], [7, 1], [3, 5]]
