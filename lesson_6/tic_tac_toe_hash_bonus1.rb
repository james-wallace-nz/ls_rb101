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

# input:
# array
# optional delimiter
# optional last join

# output:
# string of joined array elements with last element delimited with 'and'

# explicit rules:
# default delimiter is comma ',''
# default last join is 'or'

# examples:
# joinor([1, 2])                   # => "1 or 2"
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

def joinor(available, delimiter = ', ', last_join = 'or')
  string = ''
  case available.size
  when 1 then string = "#{available[0]}"
  when 2 then string = "#{available[0]} #{last_join} #{available[1]}"
  else
    available.each_with_index do |space, index|
      if available.size - 1 == index
        string << "#{last_join} #{space}"
      else
        string << "#{space}#{delimiter}"
      end
    end
  end
  string
end

# Solution:
# def joinor(array, delimiter = ', ', word = 'or')
#   case array.size
#   when 0 then ''
#   when 1 then "#{array.first}"
#   when 2 then array.join(" #{word} ")
#   else
#     array[-1] = "#{word} #{array.last}"
#     array.join(delimiter)
#   end
# end

def user_move(brd)
  available = available_moves(brd)
  move = nil
  loop do
    prompt "What's your move? (#{joinor(available, ', ', 'or')})"
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
