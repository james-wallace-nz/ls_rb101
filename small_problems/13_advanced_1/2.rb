# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

# input: odd int >= 7 - number of rows and columns
# output: 8 pointed star printed

# data structure:
# prepare string in nested array
# each first element is row
# each nested element is component to be contatenated

# algorithm:
# set result to empty array
# set num_non_middle_rows = (nth - 1) / 2
# set left_side_spaces to zero
# set middle_spaces = (n - left_side_spaces ) / 2

# 1. count up row 1 to rows
    # 1a iterate 6 times. Concatenate:
    #   1a1. left_space
    #   1a2. '*'
    #   1a3. middle_spaces
    #   1a4. '*'
    #   1a5. middle space
    #   1a6. '*'
    # 1b increment:
    #   1b1. left_side_spaces + 1
    #   1b2. middle_spaces - 1

# 2. middle row as '*' * n

# 3. count down rows to 1
    # 3a iterate 6 times. Concatenate:
    #   3a1. left_space
    #   3a2. '*'
    #   3a3. middle_spaces
    #   3a4. '*'
    #   3a5. middle space
    #   3a6. '*'
    # 3b increment:
    #   1b1. left_side_spaces - 1
    #   1b2. middle_spaces + 1

# 4. join nested array without space
# 5. print array

def star(nth)
  nested_lines = []
  num_non_middle_rows = (nth - 1) / 2
  row_spaces = nth - 3
  left_side_spaces = 0
  middle_spaces = (row_spaces - left_side_spaces) / 2

  1.upto(num_non_middle_rows) do
    line = []
    line << ' ' * left_side_spaces
    line << '*'
    line << ' ' * middle_spaces
    line << '*'
    line << ' ' * middle_spaces
    line << '*'

    nested_lines << line

    left_side_spaces += 1
    middle_spaces -= 1
  end

  middle = []
  nth.times do
    middle << '*'
  end
  nested_lines << middle

  num_non_middle_rows.downto(1) do
    left_side_spaces -= 1
    middle_spaces += 1

    line = []
    line << ' ' * left_side_spaces
    line << '*'
    line << ' ' * middle_spaces
    line << '*'
    line << ' ' * middle_spaces
    line << '*'

    nested_lines << line
  end

  lines = nested_lines.map do |line|
    line.join('')
  end
  puts lines
end

# Examples

star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

# * 2 * 2 *
# 1 * 1 * 1 *
# 3 ***
# *******
# 3 ***
# 1 * 1 * 1 *
# * 2 * 2 *

# 3 1 3

puts '----'

star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

# * 3 * 3 *       9 - 3
# 1 * 2 * 2 *
# 2 * 1 * 1 *
# 3 ***
# *********
# 3 ***
# 2 * 1 * 1 *
# 1 * 2 * 2 *
# * 3 * 3 *

# 4 1 4

# (n - 1) / 2 rows either side of middle
# middle row is '*' * n

# row width spaces = n - 3
# left side space = 0 + row number - 1

puts '----'

star(11)

# *    *    *
#  *   *   *
#   *  *  *
#    * * *
#     ***
# ***********
#     ***
#    * * *
#   *  *  *
#  *   *   *
# *    *    *

# solution

puts '----'
puts '----'

def print_grid(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  row = Array.new(3, '*').join(spaces)
  puts row.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_grid(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance) { |distance| print_grid(grid_size, distance) }
end

star(7)

puts '----'

star(9)
