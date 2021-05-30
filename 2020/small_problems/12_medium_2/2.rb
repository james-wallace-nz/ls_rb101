# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

BLOCKS = [
  ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
  ['V', 'I'], ['L', 'Y'], ['Z', 'M']
]

def block_word?(string)
  chars = string.upcase.chars
  result = true
  BLOCKS.each do |first, second|
    if chars.include?(first) && chars.include?(second)
      result = false
    end
  end
  result
end

BLOCK = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(string)
  up_string = string.upcase
  BLOCK.none? { |block| up_string.count(block) >= 2 }
end

# Examples:

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
