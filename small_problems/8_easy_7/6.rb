# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

# input: string
# output: new string
# every other character is capitalized.
# every other is even index counting every a-zA-Z character in string

def staggered_case(string, need_upper: true)
  result = ''
  string.chars.each do |char|
    result += (need_upper ? char.upcase : char.downcase)
    # need_upper = !need_upper if char =~ /[a-zA-Z]/
    need_upper = !need_upper if char =~ /[a-z]/i
  end
  result
end

# Example:

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

puts '------'

# Modify this method so the caller can determine whether non-alphabetic characters should be counted when determining the upper/lowercase state. That is, you want a method that can perform the same actions that this method does, or operates like the previous version.

# Hint: Use a keyword argument.

def staggered_case(string, need_upper: true, include_non_alpha: false)
  result = ''
  string.chars.each do |char|
    result += (need_upper ? char.upcase : char.downcase)
    # need_upper = !need_upper if char =~ /[a-zA-Z]/
    need_upper = !need_upper if include_non_alpha || char =~ /[a-z]/i
  end
  result
end

p staggered_case('I Love Launch School!', include_non_alpha: true) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', include_non_alpha: true) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', include_non_alpha: true) == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('I Love Launch School!', need_upper: false, include_non_alpha: true) == 'i lOvE LaUnCh sChOoL!'
p staggered_case('ALL_CAPS', need_upper: false, include_non_alpha: true) == 'aLl_cApS'
p staggered_case('ignore 77 the 444 numbers', need_upper: false, include_non_alpha: true) == 'iGnOrE 77 tHe 444 nUmBeRs'
