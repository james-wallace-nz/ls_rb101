# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

# PROBLEM

# Display an 8 point star in an n x n grid, where n is an odd integer
# n >= 7

# Input: Integer
# Output: print 8 pointed star

# 8 pointed star:
# 3 stars on each line above and below the middle
# n stars across the middle
# top and bottom lines are n characters across
# first line out from middle is 3 stars centered together
# each line out from middle adds a space between the stars
# top shrinks to middle then expands to bottom


# Number of non-centre rows is (n - 1) so top and bottom have (n - 1) / 2 rows
# spaces between stars is row - 1


# DATA STRUCTURE

# String


# ALGORITHM

# - set `star` as `'*'`
# - set `top_bottom_rows` as (n - 1) / 2
# - iterate `top_bottom_rows` times
# - create string for row
# - print string for row centred in width `n`
# - print centre star * n
# - repeat top in reverse for bottom


def create_row(grid_size, row)
  row = Array.new(3, '*').join(' ' * (row - 1))
  row.center(grid_size)
end

# CODE

def star(grid_size)
  top_bottom_rows = (grid_size - 1) / 2

  top_bottom_rows.downto(1) do |row|
    puts create_row(grid_size, row)
  end

  puts '*' * grid_size

  1.upto(top_bottom_rows) do |row|
    puts create_row(grid_size, row)
  end

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

puts

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
