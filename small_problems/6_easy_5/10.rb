# Write a method that will take a short line of text, and print it within a box.

# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# You may assume that the input will always fit in your terminal window.

def print_in_box(string)
  top_bottom_dashes = '-' * string.size
  middle_spaces = ' ' * string.size
  line_1_5_start = '+-'
  line_2_4_start = '| '
  line_1_5_end = '-+'
  line_2_4_end = ' |'
  line_3_start = '| '
  line_3_end = ' |'
  "#{line_1_5_start + top_bottom_dashes + line_1_5_end}\n#{line_2_4_start + middle_spaces + line_2_4_end}\n#{line_3_start + string + line_3_end}\n#{line_2_4_start + middle_spaces + line_2_4_end}\n#{line_1_5_start + top_bottom_dashes + line_1_5_end}"
end

puts print_in_box('To boldly go where no one has gone before.')
puts print_in_box('')

puts '-----'

# Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.
