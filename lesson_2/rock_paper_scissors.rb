# Ask user for a chioce
# Computer makes a choice
# Compare and decide winner

def test_method
  prompt('Testing...')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  if player == computer
    prompt('It was a draw!')
  elsif WIN_CONDITIONS.include?([player, computer])
    prompt('You win!')
  else
    prompt('Computer won!')
  end
end

CHOICES = ['rock', 'paper', 'scissors']
WIN_CONDITIONS = [
  ['rock', 'scissors'],
  ['paper', 'rock'],
  ['scissors', 'paper']
]

prompt('Welcome to Rock Paper Scissors!')

loop do
  user = ''
  loop do
    prompt("What is your choice ('Rock', 'Paper', 'Scissors')?")
    user = Kernel.gets().chomp().downcase()
    if CHOICES.include?(user)
      prompt("You chose #{user.capitalize()}")
      break
    else
      prompt('Make a valid choice.')
    end
  end

  computer = CHOICES.sample()
  prompt("The computer chose #{computer.capitalize()}")

  display_results(user, computer)

  prompt('Play again (y/n)')
  play_again = Kernel.gets().chomp()
  break unless play_again.downcase().start_with?('y')
end

prompt('Thanks for playing Rock Paper Scissors')


# With parentheses and Kernel removed

# def prompt(message)
#   puts "=> #{message}"
# end

# def result(player, computer)
#   if player == computer
#     'It was a draw!'
#   elsif player == 'rock' && computer == 'scissors'
#     'You win!'
#   elsif player == 'paper' && computer == 'rock'
#     'You win!'
#   elsif player == 'scissors' && computer == 'paper'
#     'You win!'
#   else
#     'Computer won!'
#   end
# end

# CHOICES = ['rock', 'paper', 'scissors']

# prompt('Welcome to Rock Paper Scissors!')

# loop do
#   user = ''
#   loop do
#     prompt("What is your choice ('Rock', 'Paper', 'Scissors')?")
#     user = gets.chomp.downcase
#     if CHOICES.include?(user)
#       prompt("You chose #{user.capitalize}")
#       break
#     else
#       prompt('Make a valid choice.')
#     end
#   end

#   computer = CHOICES.sample
#   prompt("The computer chose #{computer.capitalize}")

#   winner = result(user, computer)
#   prompt(winner.to_s)

#   prompt('Play again (y/n)')
#   play_again = gets.chomp
#   break unless play_again.downcase.start_with?('y')
# end

# prompt('Thanks for playing Rock Paper Scissors')