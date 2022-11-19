# Loan amount (p)
# APR
# Loan duration

# Calculate:
# Monthly interest rate (j)
# Loan duration in months (n)
# Monthly repayment (m)

# m = p * (j / (1 - (1 + j)**(-n)))

# Pesudocode:
# GET valid loan amount
# SET loan_amount

# GET valid APR
# SET apr_annual

# GET valid loan duration
# SET duration_years

# SET duration_months as duration_years / 12
# SET apr_monthly as apr_annual / 12
# SET repayment_monthly based on formula
# PRINT repayment_monthly

def valid_number(num)
  /\d/.match(num) && /^-?\d*\.?\d*$/.match(num) && num.to_f.positive?
end

def get_valid_number(type)
  number = 0
  loop do
    puts "Enter the #{type}"
    number = gets.chomp
    break if valid_number(number)

    puts 'Invalid positive number, please try again.'
  end
  number
end

def calculate_again?
  puts 'Do you want to calculate another loan? (y/n)'
  choice = gets.chomp.downcase
  choice == 'y'
end

puts 'Welcome to Loan Calculator!'

loop do
  loan_amount = get_valid_number('loan amount').to_f
  apr_annual = get_valid_number('annual APR in percent (e.g. 5 for 5%)').to_f
  duration_years = get_valid_number('loan duration in years').to_f

  duration_months = duration_years * 12
  apr_monthly = apr_annual / 12 / 100

  monthly_repayment = loan_amount *
                      (apr_monthly /
                      (1 - (1 + apr_monthly)**-duration_months))

  puts "Your monthly repayment is $#{format('%.2f', monthly_repayment)}."

  break unless calculate_again?
end

puts 'Thanks for using loan calculator.'
