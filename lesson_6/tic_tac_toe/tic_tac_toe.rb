# Steps:
# 1. create empty 3x3 board
# 2. display empty board
# 3. user move
# 4. computer move
# 5. winner? -> end game
# 6. tie? -> end game
# 7. loop 2
# 8. end game - display winner
# 9. play again?
# 10. exit

# Methods:
# create_board
# display_board
# update_board(player, position)
# winner?(board)
# tie?(board)

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]}"
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]}"
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]}"
end

def update_board(board, token, position)
  board[position] = token
end

def user_move(board)
  available_moves = available_moves(board)
  move = nil
  loop do
    print "\nAvailable moves: "
    puts "#{available_moves.join(" ")}"
    puts "\nWhat is your move?"
    move = gets.chomp
    break if valid_move?(board, move)
    puts 'Invalid move, try again.'
  end
  move = move.to_i - 1
  puts "\nYou take #{move + 1} \n"
  move
end

def computer_move(board)
  move = available_moves(board).sample - 1
  puts "\nComputer takes #{move + 1} \n"
  move
end

def valid_move?(board, move)
  move.to_i.is_a?(Integer) && board[move.to_i - 1] == ' ' && move != '' && move != '0'
end

def available_moves(board)
  available_moves = []
  board.each_with_index do |element, index|
    available_moves << index + 1 if element == ' '
  end
  available_moves
end

def winner?(board)
  win_conditions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
  winner = false
  win_conditions.each do |condition|
    if board[condition[0]] == HUMAN_TOKEN && board[condition[1]] == HUMAN_TOKEN && board[condition[2]] == HUMAN_TOKEN
      puts "\n#{USER_NAME} wins!"
      winner = true
      break
    elsif board[condition[0]] == COMPUTER_TOKEN && board[condition[1]] == COMPUTER_TOKEN && board[condition[2]] == COMPUTER_TOKEN
      puts "\nComputer wins!"
      winner = true
      break
    end
  end
  winner
end

def tie?(board)
  if available_moves(board).empty?
    puts \n"Tie!"
    true
  end
end

def result(board)
  winner?(board) || tie?(board)
end

puts 'Welcome to Tic Tac Toe'
print 'What is your name? '
USER_NAME = gets.chomp
puts
HUMAN_TOKEN = 'X'
COMPUTER_TOKEN = 'O'

loop do
  game_board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  display_board(game_board)
  loop do
    update_board(game_board, HUMAN_TOKEN, user_move(game_board))
    display_board(game_board)
    break if result(game_board)

    update_board(game_board, COMPUTER_TOKEN, computer_move(game_board))
    display_board(game_board)
    break if result(game_board)
  end

  # display winner or tie

  puts "\nPlay again? (y/n)"
  answer = gets.chomp
  break if answer.downcase != 'y'
end
