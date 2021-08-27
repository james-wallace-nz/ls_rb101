# In the previous exercise, you wrote a method to ` a 3 x 3 matrix as represented by a ruby Array of Arrays.

# Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.

# Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

=begin
PROBLEM

Transpose a n x m matrix
Array must have minimum 1 row and 1 column

[
  [x]
]

==

[
  [x]
]


[
  [1, 2, 3, 4]
]

==  [0][0], [0][1], [0][2], [0][3] => [0][0], [1][0], [2][0], [3][0]

[
  [1],
  [2],
  [3],
  [4]
]


[[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]

[
  [1, 2, 3, 4, 5],
  [4, 3, 2, 1, 0],
  [3, 7, 8, 6, 2]
]


[
  [1, 4, 3],
  [2, 3, 7],
  [3, 2, 8],
  [4, 1, 6],
  [5, 0, 2]
]

row, column

0,0
1,0
2,0

0,1
1,1
2,1

0,2
1,2
2,2

0,3
1,3
2,3

0,4
1,4
2,4


Input: nested array
Output: new nested array


DATA STRUCTURE

Array


ALGORITHM

- initialize `transposed` variable and assign empty array
- create new row
- append to `transposed`
- return `transposed

  Create new row:
    - iterate across the rows
      - initialize `new_row` to empty array
      - iterate across the coluns
        - append `array` value at row, column to `new_row`
      - append `new_row` to `transposed`

  Create new row with `map`
    > map should return new row
    > map iterates over an array and returns a transformed array

    (o to number of columns) |column_index|
      new_row = (0 to number of rows).map |row_index|
        matrix[row_index, column_index]

    - transposed << new_row

CODE
=end


def transpose(matrix)
  transposed = Array.new

  matrix[0].each_index do |column_index|          # 0 to 4
    new_row = []
    matrix.each_index do |row_index|              # 0 to 2
      new_row << matrix[row_index][column_index]
    end
    transposed << new_row
  end

  transposed
end


def transpose(matrix)
  transposed = Array.new

  rows = matrix.size
  columns = matrix.first.size


  (0...columns).each do |column_index|
    new_row = (0...rows).map do |row_index|
      matrix[row_index][column_index]
    end
    transposed << new_row
  end

  transposed
end


# Examples:

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
