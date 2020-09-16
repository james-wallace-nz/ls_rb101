# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

# input: string
# output: new string
# every other character is capitalized.
# every other is even index counting every character in string
# non a-zA-Z are not changed but count for index

# algorithm:
# 1. split into chars
# 2. iterate through chars
# 3. if index even then upcase
# 4. else downcase
# 5. join and return

def staggered_case(string)
  chars = string.chars
  staggered = ''
  chars.each_with_index do |char, idx|
    staggered << (idx.even? ? char.upcase : char.downcase)
  end
  staggered
end

# solution

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

# Example:

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts '----'

# Can you modify this method so the caller can request that the first character be downcased rather than upcased? If the first character is downcased, then the second character should be upcased, and so on.

# Hint: Use a keyword argument.

def staggered_case(string, need_upper: true)
  result = ''
  string.chars.each do |char|
    result += need_upper ? char.upcase : char.downcase
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!', need_upper: false) == 'i lOvE LaUnCh sChOoL!'
p staggered_case('ALL_CAPS', need_upper: false) == 'aLl_cApS'
p staggered_case('ignore 77 the 444 numbers', need_upper: false) == 'iGnOrE 77 tHe 444 nUmBeRs'
