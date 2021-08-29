# A Rational Number is any number that can be represented as the result of the division between two integers, e.g., 1/3, 3/2, 22/7, etc. The number to the left is called the numerator, and the number to the right is called the denominator.

# A Unit Fraction is a rational number where the numerator is 1.

# An Egyptian Fraction is the sum of a series of distinct unit fractions (no two are the same), such as:

# 1   1    1    1
# - + - + -- + --
# 2   3   13   15

# Every positive rational number can be written as an Egyptian fraction. For example:

#     1   1   1   1
# 2 = - + - + - + -
#     1   2   3   6

# Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an Egyptian Fraction representation of the number, and another that takes an Array of numbers in the same format, and calculates the resulting Rational number. You will need to use the Rational class provided by Ruby.

=begin
PROBLEM

egyptian - takes a rational number as an argument and returns an Array of denominators that represent the egyptian fraction

Input: Rational number
Output: Array of denominators


unegyptian - takes an array of denominators that represent the egyptian fraction and calculate the rational number

Input: Array of denominators
Output: Rational number



DATA STRUCTURES

Array
Integers
Rational numbers


ALGORITHM

egyptian:
create denominators as empty array
start denominator_count at 1
if denominator divides evenly into Rational(argument)
  subtract denominator_count from argument
  add denominator to denominators
increment denominator_count by 1
repeat until residual is 0
return denominators

unegyptian:
sum each element in array as Rational(1, element)


CODE
=end

def egyptian(rational)
  denominators = Array.new
  denominator = 1

  until rational == 0
    if rational - Rational(1, denominator) >= 0
      rational -= Rational(1, denominator)
      denominators << denominator
    end
    denominator += 1
  end

  denominators
end

def unegyptian(egyptian)
  egyptian.reduce(Rational(0)) do |sum, denominator|
    sum + Rational(1, denominator)
  end
end


# Examples:

p egyptian(Rational(2, 1))    == [1, 2, 3, 6]
p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian([1, 2, 3, 6]) == Rational(2, 1)
p unegyptian([1, 2, 3, 4, 5]) == Rational(137, 60)

p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# Every rational number can be expressed as an Egyptian Fraction. In fact, every rational number can be expressed as an Egyptian Fraction in an infinite number of different ways. Thus, the first group of examples may not show the same values as your solution. They do, however, show the expected form of the solution. The remaining examples merely demonstrate that the output of egyptian can be reversed by unegyptian.

