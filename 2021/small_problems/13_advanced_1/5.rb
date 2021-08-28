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

=begin

PROBLEM

Rotate a nested array (matrix) 90 degrees clockwise

Input: matrix
Output: rotated matrix


DATA STRUCTURE

Nested array


ALGORITHM

create new empty array
Iterate across columns (0 to 2)
  create new array for row
  Iterate up rows (2 to 0)
    add value to new row
  add new row array to new array


row, col

0,0     0,2
0,1     1,2
0,2     2,2

1,0     0,1
1,1     1,1
1,2     2,1

2,0     0,0
2,1     1,0
2,2     2,0


CODE
=end

def rotate90(matrix)
  rotated = Array.new

  (0...matrix.first.size).each do |column_index|
    new_row = []
    (matrix.size - 1).downto(0) do |row_index|
      new_row << matrix[row_index][column_index]
    end

    # new_row = (matrix.size - 1).downto(0).map do |row_index|
    #             matrix[row_index][column_index]
    #           end

    rotated << new_row
  end

  rotated
end


# Examples

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# [
#   [3, 4, 1],
#   [9, 7, 5],
#   [6, 2, 8]
# ]


matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# This program should print "true" three times.

=begin
Bonus: rotations based on argument:
90
180
270
360
=end
