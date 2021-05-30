# 1. Understanding the Problem
# 3x3 game board.
# User marks a square 'X' then computer marks a square 'O'.
# Player wins if three squares horizontally, vertically, or diagonally.
# Tie if all squares filled and no winner.

# Input:
# - user inputs integer - 1 - 9 for available space to mark user move
# - computer integer selected for available space to mark computer move

# Output:
# - gameboard

# Explicit requirements:
# - user/computer cannot move to an already marked space

# Implicit requirements:
# - user moves first
# - win means board will match one of many known win conditions

# 2. Examples and Test Cases

# empty board:

#      |     |
#      |     |
#      |     |
# -----+-----+-----
#      |     |
#      |     |
#      |     |
# -----+-----+-----
#      |     |
#      |     |
#      |     |

# user wins::

#      |     |
#   X  |  X  |  X
#      |     |
# -----+-----+-----
#      |     |
#   O  |     |
#      |     |
# -----+-----+-----
#      |     |
#   O  |  O  |
#      |     |

# computer wins:

#      |     |
#   X  |  X  |  O
#      |     |
# -----+-----+-----
#      |     |
#   X  |  O  |
#      |     |
# -----+-----+-----
#      |     |
#   O  |     |
#      |     |

# tie:

#      |     |
#   X  |  O  |  X
#      |     |
# -----+-----+-----
#      |     |
#   X  |  X  |  O
#      |     |
# -----+-----+-----
#      |     |
#   O  |  X  |  O
#      |     |

# 3. Data Structures
# - game board saved as hash
#   - keys 1 - 9 as keys
#   - values initially empty string ' ' then replaced with player token

# 4. Algorithms

# Pseudocode:
# 1. initialise board
#   - board saved as empty hash
#   - iterate through 1 - 9
#   - add each integer to hash as key with empty string as value

# 2. display board
#   - board variable as parameter
#   - place each board key in space on empty board to provide space mark
#   - print board

# 3. user marks square
#   - determine available spaces on board
#   - print available spaces and request move from user
#   - get user move as integer
#   - validate user space and loop if invalid
#     - intger is within available spaces
#   - mark user space on board
#   - winner? -> play again?
#   - tie?    -> play again?

# 4. computer marks square
#   - determine available spaces on board
#   - get computer move as integer from available spaces using #sample
#   - mark computer space on board
#   -  winner? -> play again?
#   -  tie?    -> play again?

# 5. play again?
#   - get user input to play again
#   - stop if not 'y' then print exit message
#   - otherwise loop to 2

# 5. Implementing a solution in Code

EMPTY_SQUARE = ' '
HUMAN_TOKEN = 'X'
COMPUTER_TOKEN = 'O'
WIN_CONDITIONS = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
]

def prompt(msg)
  puts "=> #{msg}"
end

def initialise_board
  new_board = {}
  (1..9).each do |num|
    new_board[num] = EMPTY_SQUARE
  end
  new_board
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're an #{HUMAN_TOKEN}. Computer is a #{COMPUTER_TOKEN}."
  puts ''
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ''
end
# rubocop:enable Metrics/AbcSize

def available_moves(brd)
  brd.keys.select { |space| brd[space] == EMPTY_SQUARE }
end

def user_move(brd)
  available = available_moves(brd)
  move = nil
  loop do
    prompt "What's your move? (#{available.join(', ')})"
    move = gets.chomp.to_i
    break if valid_move?(brd, move)
    prompt "Invalid move, try again."
  end
  update_board(brd, move, HUMAN_TOKEN)
end

def valid_move?(brd, space)
  available_moves(brd).include?(space)
end

def computer_move(brd)
  move = available_moves(brd).sample
  update_board(brd, move, COMPUTER_TOKEN)
end

def update_board(brd, space, token)
  brd[space] = token
end

def game_result?(brd)
  winner = detect_winner(brd)
  if winner
    prompt "#{winner} won!"
    true
  elsif tie?(brd)
    prompt "Tie!"
    true
  else
    false
  end
end

def detect_winner(brd)
  WIN_CONDITIONS.each do |condition|
    if brd.values_at(*condition).all?(HUMAN_TOKEN)
      return 'You'
    elsif brd.values_at(*condition).all?(COMPUTER_TOKEN)
      return 'Computer'
    end
  end
  nil
end

def tie?(brd)
  available_moves(brd).empty?
end

loop do
  game_board = initialise_board
  display_board(game_board)
  prompt "Welcome to Tic Tac Toe!"

  loop do
    user_move(game_board)
    display_board(game_board)
    break if game_result?(game_board)

    computer_move(game_board)
    display_board(game_board)
    break if game_result?(game_board)
  end

  prompt "Play again? (y/n)"
  play_again = gets.chomp
  break unless play_again.downcase == 'y'
end

prompt "Thanks for playing Tic Tac Toe!"
