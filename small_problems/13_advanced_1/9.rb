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

# The Rational class represents fractions
# Rational(a, b) is a rational object a / b
# a / 1 = integer, 2 / 1 = 2
# Array is the denominators, numerator is always 1
# can have 1 / 1 as unit fraction

# input: rational number
# output: array of denominators that make up the egyptian fraction represenation of the number
# algorithm:
# 1a. find largest fraction: denominator / numerator rounded up = denominator (n) of largest fraction 1 / n
  # 1b. pass unit fraction denominator to result array
# 2. subtract unit fraction from rational number to get remainder
# repeat 1 on remainder until remainder is a unit fraction itself
# 3. return result array of denominators

# unit fraction denominator cannot be repeated

# => split numerator and denominator into variables?

def egyptian(fraction)
  egyption_denominators = []
  remainder = fraction
  numerator_remainder = remainder.numerator
  denominator_remainder = remainder.denominator

  loop do
    largest_denominator = (denominator_remainder / numerator_remainder.to_f).ceil
    largest_denominator += 1 if egyption_denominators.include?(largest_denominator) # error here - not always + 1
    egyption_denominators << largest_denominator

    remainder = Rational(numerator_remainder * largest_denominator, denominator_remainder * largest_denominator) -
                Rational(1 * denominator_remainder, largest_denominator * denominator_remainder)

    break if egyption_denominators.reduce(0) { |memo, denom| memo + Rational(1, denom) } == fraction

    numerator_remainder = remainder.numerator
    denominator_remainder = remainder.denominator
  end
  egyption_denominators
end

# input: array of egyptian fractions
# output: resulting rational number
# algorithm:

# def unegyptian(egyption_fractions)

# end

# Examples:

p egyptian(Rational(2, 1)) == [1, 2, 3, 6]

p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]

p egyptian(Rational(3, 1)) # == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
# unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
# unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# Every rational number can be expressed as an Egyptian Fraction. In fact, every rational number can be expressed as an Egyptian Fraction in an infinite number of different ways. Thus, the first group of examples may not show the same values as your solution. They do, however, show the expected form of the solution. The remaining examples merely demonstrate that the output of egyptian can be reversed by unegyptian.

# For more info on Egyptian Fractions, see this page.

# http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fractions/egyptian.html#calc1

# t / b < 1
# if t = 1 then it is solved because it is already a unit fraction

#   Find the biggest unit fraction we can and take it from t / b
#   Repeat with what is left.

# examples:

# 521 / 1050
# 521 is < 1 / 2 1050 but bigger than 1 / 3 1050 => largest fraction we can take away is 1 / 3

# 521 / 1050 = 1 / 3 + R
# 521 / 1050 - 1 / 3 = 171 / 1050 = 57 / 350

# repeat the process on 57 / 350

# The largest unit fraction is 1 / 7 and the remainder is 1 / 50 (7 / 350)

# divide the bottom number (350) by the top one (57) and get 6.14. We need a number larger than 6 since we have 6 + 0.14. The next one above 6 is 7.

# The numerator and denominator keep reducign until the numerator reaches 1 then the process stops = the final remainder is a unit fraction so we can stop.

# example

# 5 / 21

# puts 21.to_f / 5

# 5 / 21 = 1 / 5 + R
# 5 / 21 - 1 / 5 = 25 / 105 - 21 / 105 = 4 / 105

# puts 105.to_f / 4 = 1 / 27

# 5 / 21 = 1 / 5 - 1 / 27 + R

# 4 / 105 - 1 / 27 = 108 / 2835 - 105 / 2835 = 3 / 2835 = 1 / 945

# 5 / 21 = 1 / 5 - 1 / 27 + 1 / 945

p egyptian(Rational(5, 21)) == [5, 27, 945]
