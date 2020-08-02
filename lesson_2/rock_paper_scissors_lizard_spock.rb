CHOICES = %w(rock paper scissors lizard spock)
SHORT_CHOICES = %w(r p s l sp)

WIN_CONDITIONS = {
  ['rock', 'scissors'] => 'Rock crushes scissors',
  ['paper', 'rock'] => 'Paper covers rock',
  ['scissors', 'paper'] => 'Scissors cut paper',
  ['rock', 'lizard'] => 'Rock crushes lizard',
  ['lizard', 'spock'] => 'Lizard poisons Spock',
  ['spock', 'scissors'] => 'Spock smashes sissors',
  ['scissors', 'lizard'] => 'Scissors decapitates lizard',
  ['lizard', 'paper'] => 'Lizard eats paper',
  ['paper', 'spock'] => 'Paper disproves Spock',
  ['spock', 'rock'] => 'Spock vaporizes rock'
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def winner(user, computer)
  if user == computer
    'tie'
  elsif win?(user, computer)
    'user'
  elsif win?(computer, user)
    'computer'
  end
end

def win?(first_player, second_player)
  WIN_CONDITIONS.keys().include?([first_player, second_player])
end

def display_winner(winner, player, computer)
  case winner
  when 'tie'
    prompt("It's a tie!")
  when 'user'
    prompt("#{WIN_CONDITIONS[[player, computer]]}!")
    prompt('You won!')
  when 'computer'
    prompt("#{WIN_CONDITIONS[[computer, player]]}!")
    prompt('Computer won!')
  end
end

def display_scores(user, computer)
  prompt("You have a score of: #{user}.")
  prompt("Computer has a score of: #{computer}")
end

def display_grand_winner(user, computer)
  if user > computer
    prompt("You won with a score of #{user} against the computer score of #{computer}!")
  else
    prompt("Computer won with a score of #{computer} against your score of #{user}!")
  end
end

prompt("Welcome to #{CHOICES.join(', ')}!")

user_score = 0
computer_score = 0

loop do
  user_choice = ''
  loop do
    prompt("What is your choice (#{CHOICES.join(', ')}) or (#{SHORT_CHOICES.join(', ')})?")
    user_choice = Kernel.gets().chomp().downcase()

    if SHORT_CHOICES.include?(user_choice)
      user_choice = CHOICES[SHORT_CHOICES.index(user_choice)]
    end

    if CHOICES.include?(user_choice)
      prompt("You chose #{user_choice.capitalize()}")
      break
    else
      prompt('Make a valid choice.')
    end
  end

  computer_choice = CHOICES.sample()
  prompt("The computer chose #{computer_choice.capitalize()}")

  winner = winner(user_choice, computer_choice)
  display_winner(winner, user_choice, computer_choice)
  prompt('-------------')

  case winner
  when 'user' then user_score += 1
  when 'computer' then computer_score += 1
  end
  display_scores(user_score, computer_score)
  prompt('-------------')

  break if user_score == 5 || computer_score == 5

  prompt('Play again (y/n)')
  play_again = Kernel.gets().chomp()
  break unless play_again.downcase().start_with?('y')
end

display_grand_winner(user_score, computer_score)
prompt("Thanks for playing #{CHOICES.join(', ')}")
