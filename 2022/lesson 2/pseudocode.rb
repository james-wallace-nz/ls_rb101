# 1.

# DEFINE method with two integer parameters, num1 and num2
#   add num1 + num2
# END

def add(num1, num2)
  num1 + num2
end

puts add(1, 2)


# 2.

# Define method with one parameter, strings
# SET concat = empty string
# SET count = 0
# WHILE count < strings.length
#   concat = concat << value at strings array count index
#   SET count = count + 1
# END
# RETURN concat

def concat(strings)
  concat = ''
  count = 0
  while count < strings.size
    concat << strings[count]
    count += 1
  end
  concat
end

puts concat(['abc', '123', 'xyz'])


# 3.

# DEFINE method with one parameter
#  SET count = 0
#  SET every_other = empty array
#  WHILE count < parameter length
#   IF count + 1 is odd
#     every_other << value within parameter at space 'count'
#   END
#   SET count = count + 1
#  END
#  RETURN every_other
# END

def every_other(integers)
  count = 0
  every_other = []
  while count < integers.size
    if (count + 1).odd?
      every_other << integers[count]
    end
    count += 1
  end
  every_other
end

p every_other([1, 4, 7, 2, 5])


# 4.

# A method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

# DEFINE method with two parameters, string and character
#   SET count = 0
#   SET seen = 0
#   SET index = nil
#   WHILE count is less than string length
#     IF character is equal to value at string space 'count'
#       SET seen = seen + 1
  #     IF seen is equal to 3
  #       SET index = count
  #     END
#     END
#     SET count = count + 1
#   END
#   RETURN index
# END

def third_index(string, char)
  count = 0
  seen = 0
  index = nil
  while count < string.length
    if string[count] == char
      seen += 1
      index = count if seen == 3
    end
    count += 1
  end
  index
end

puts third_index('axbxcdxex', 'x')


# 5.

# DEFINE method with two array parameters
# SET new_array = empty array
# SET count = 0
#   WHILE count < parameter one length
#     new_array << parameter one value at space 'count'
#     new_array << parameter two value at space 'count'
#     count = count + 1
#   END
# RETURN new_array
# END

def merge(one, two)
  merged = []
  count = 0
  while count < one.size
    merged << one[count]
    merged << two[count]
    count += 1
  end
  merged
end

p merge([1, 2, 3], [4, 5, 6])
