# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.


# PROBLEM:

# The string passed in can use one but not both characters in a spelling block.
# The string must use characters only from the available spelling blocks


# Input: string
# Output: boolean


# EXAMPLES:

# `BUTCH` contains both characters from the spelling block `H:U`
# It is not clear if the spelling blocks are case sensitive, but they appear to be. e.g. 'butch' should return `false`?


# DATA STRUCTURES:

# Store spelling blocks as a hash


# ALGORITHM:

# - initialize `result` = true
# - initialize `characters` by splitting `word`

# - iterate through `characters`
#   - does any character get used twice?
#   - does any? `block` have both characters used in `characters` Array?
#   - for each block, are all? characters used in `characters' Array?

SPELLING_BLOCKS = {
                    'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A',
                    'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U',
                    'V' => 'I', 'L' => 'Y', 'Z' => 'M'
                  }


def block_word?(word)
  result = true
  characters = word.chars.map(&:upcase)

  characters.each do |character|
    if characters.count(character) > 1
      return false
    elsif SPELLING_BLOCKS[character] != nil
      return false if word.upcase.include?(SPELLING_BLOCKS[character])
    elsif SPELLING_BLOCKS.key(character) != nil
      return false if word.upcase.include?(SPELLING_BLOCKS.key(character))
    end
  end

  result
end


puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('butch') == false
puts block_word?('jest') == true
