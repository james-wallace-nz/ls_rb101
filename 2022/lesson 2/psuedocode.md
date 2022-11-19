# 1.

A method that returns the sum of two integers

DEFINE method with two integer parameters, num1 and num2
  add num1 + num2
END


# 2.

A method that takes an array of strings, and returns a string that is all those strings concatenated together

Define method with one parameter, strings
SET concat = empty string
SET count = 0
WHILE count < strings.length
  concat = concat << value at strings array count index 
  SET count = count + 1
END
RETURN concat  


# 3.

A method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:
`everyOther([1,4,7,2,5]) # => [1,7,5]`

DEFINE method with one parameter
 SET count = 0
 SET every_other = empty array
 WHILE count < parameter length
  IF count + 1 is odd
    every_other << value within parameter at space 'count'
  END
  SET count = count + 1
 END
 RETURN every_other
END


# 4.

A method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

DEFINE method with two parameters, string and character
  SET count = 0
  SET seen = 0
  SET index = nil
  WHILE count is less than string length
    IF character is equal to value at string space 'count'
      SET seen = seen + 1
      IF seen is equal to 3
        SET index = count
      END
    END
    SET count = count + 1
  END
  RETURN index
END


# 5.

A method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. For instance:
`merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]`

DEFINE method with two array parameters
SET new_array = empty array
SET count = 0
  WHILE count < parameter one length
    new_array << parameter one value at space 'count'
    new_array << parameter two value at space 'count'
    count = count + 1
  END
RETURN new_array
END

