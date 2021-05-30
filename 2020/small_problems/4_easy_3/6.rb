# The || operator returns a truthy value if either or both of its operands are truthy, a falsey value if both operands are falsey. The && operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

# In this exercise, you will write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

def xor?(int_a, int_b)
  !!((int_a || int_b) && !(int_a && int_b))
end

def xor?(int_a, int_b)
  !!((int_a && !int_b) || (!int_a && int_b))
end

# Examples:

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false


# Further Exploration

# || and && are so-called short circuit operators in that the second operand is not evaluated if its value is not needed. Does the xor method perform short-circuit evaluation of its operands? Why or why not? Does short-circuit evaluation in xor operations even make sense?

# Xor always needs to evaluate both operands so short-curcuit evaluation doesn't make sense.
