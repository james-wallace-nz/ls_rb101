# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

# input: odd integer
# output: diamond where each row increases number of '*' from one to n by one '*' either side

# pattern:
# start with stars equal 1
# add 2 until stars equal n
# subtract 2 until stars equal 1

# algo:
# set stars = 1
# loop while stars <= n
#     print stars centered by n spaces
#     increment stars by 2
# end
# loop while stars >= 1
#     print stars centered by n spaces
#     decrement stars by 2
# end

# def diamond(n)
#   stars = 1
#   while stars < n
#     puts ("*" * stars).center(n)
#     stars += 2
#   end
#   while stars >= 1
#     puts ("*" * stars).center(n)
#     stars -= 2
#   end
# end

# algo:
# determine max spaces
# determine left hand side spaces for the row
# count down from max spaces to 0
#   print row for each space increment
# count up from 1 to max spaces
#   print row for each space increment

def print_row(spaces, grid_size)
  number_of_stars = grid_size - spaces * 2
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_spaces = (grid_size - 1) / 2
  max_spaces.downto(0) { |spaces| print_row(spaces, grid_size) }
  1.upto(max_spaces) { |spaces| print_row(spaces, grid_size) }
end


# Examples

diamond(1)

# *

diamond(3)

#  *
# ***
#  *


diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *


# Further Exploration

# Try modifying your solution or our solution so it prints only the outline of the diamond:

def print_row(spaces, grid_size)
  number_of_stars = grid_size - spaces * 2
  if number_of_stars > 1
    stars = '*' + ' ' * (number_of_stars - 2) + '*'
  else
    stars = '*'
  end
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_spaces = (grid_size - 1) / 2
  max_spaces.downto(0) { |spaces| print_row(spaces, grid_size) }
  1.upto(max_spaces) { |spaces| print_row(spaces, grid_size) }
end

diamond(5)

#   *
#  * *
# *   *
#  * *
#   *

diamond(9)

#     *
#    * *
#   *   *
#  *     *
# *       *
#  *     *
#   *   *
#    * *
#     *
