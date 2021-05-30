# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

# P:
# input: n - max number of diamonds
# output: 4 pointed diamond

# Right justify * with spaces
# middle is always 1 *
# left and right sides of middle are n - 1 characters
# left half spaces = left half - # *
# # * is odd numbers from 1 to n

# E:
# spaces, *
# 4, 1 (0)
# 3, 3 (2)
# 2, 5 (4)
# 1, 7 (6)
# 0, 9 (8)

# D:
# none - rjust * as string

# A:
# increment * by 2 from 1 to n
# spaces is n - 1 - number #
# print spaces then number *
# return nothing

def diamond(grid_size)
  left_half = grid_size / 2
  spaces = left_half
  1.upto(grid_size - 1) do |iteration|
    if iteration.odd?
      puts "#{' ' * spaces}#{'*' * iteration}"
      spaces -= 1
    end
  end

  puts "#{'*' * grid_size}"

  (grid_size - 1).downto(1) do |iteration|
    if iteration.odd?
      spaces += 1
      puts "#{' ' * spaces}#{'*' * iteration}"
    end
  end
end

# Examples

diamond(1)
# *

puts '----'

diamond(3)
#  *
# ***
#  *

puts '----'

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

puts '---'
puts '---'

# Solution:

def print_row(grid_size, distance_from_centre)
  number_of_stars = grid_size - 2 * distance_from_centre                  # 9 - 8, 6, 4, 2, 0 = 1, 3, 5, 7, 9 then # 9 - 2, 4, 6,  8 = 7, 5, 3, 1
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)                                                    # 9
  max_distance = (grid_size - 1) / 2                                      # 4
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }    # 4, 3, 2, 1, 0 (spaces)
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }      # 1, 2, 3, 4 (spaces)
end

# Examples

diamond(1)
# *

puts '----'

diamond(3)
#  *
# ***
#  *

puts '----'

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

puts '----'
puts '----'

# Try modifying your solution or our solution so it prints only the outline of the diamond:

def print_row(grid_size, distance_from_centre)
  number_of_stars = grid_size - 2 * distance_from_centre                  # 5 - 4, 2, 0 = 1, 3, 5 then # 5 - 2, 4 = 3, 1
  stars = ''
  1.upto(number_of_stars) do |number|
    if number == 1 || number == number_of_stars
      stars << '*'
    else
      stars << ' '
    end
  end
  puts stars.center(grid_size)
end

def diamond(grid_size)                                                    # 5
  max_distance = (grid_size - 1) / 2                                      # 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }    # 2, 1, 0 (spaces)
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }      # 1, 2 (spaces)
end

diamond(5)

#   *
#  * *
# *   *
#  * *
#   *
