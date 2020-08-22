EMPTY_SQUARE = ' '
HUMAN_TOKEN = 'X'
COMPUTER_TOKEN = 'O'
MATCH_GAMES = 5
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
def display_board(brd, reset_screen = true)
  system 'clear' if reset_screen

  prompt "You're an #{HUMAN_TOKEN}. Computer is an #{COMPUTER_TOKEN}."

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

def game_result?(brd, scores)
  winner = detect_winner(brd)
  if winner
    update_scores(scores, winner)
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
      return HUMAN_TOKEN
    elsif brd.values_at(*condition).all?(COMPUTER_TOKEN)
      return COMPUTER_TOKEN
    end
  end
  nil
end

def tie?(brd)
  available_moves(brd).empty?
end

def update_scores(scores, winning_player)
  if winning_player == HUMAN_TOKEN
    prompt "You won!"
    scores[0] += 1
  else
    prompt "Computer won!"
    scores[1] += 1
  end
  print_scores(scores)
end

def display_match_winner(scores)
  if scores[0] > scores[1]
    prompt "You won the match #{scores[0]} to #{scores[1]}!"
  else
    prompt "Computer won the match #{scores[1]} to #{scores[0]}!"
  end
end

def print_scores(scores)
  prompt "You have a score of #{scores[0]} to computer's #{scores[1]}."
end

scores = [0, 0]
prompt "Welcome to Tic Tac Toe!"

loop do
  game_board = initialise_board
  display_board(game_board, false)

  loop do
    user_move(game_board)
    display_board(game_board)
    break if game_result?(game_board, scores)

    computer_move(game_board)
    display_board(game_board)
    break if game_result?(game_board, scores)
  end

  break if scores.max == MATCH_GAMES
end

display_match_winner(scores)
prompt "Thanks for playing Tic Tac Toe!"
