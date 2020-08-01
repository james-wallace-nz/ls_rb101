# Mortgage / Car Loan Calculator

# request:
# - the loan amount
# - the Annual Percentage Rate (APR)
# - the loan duration

# calculate:
# - monthly interest rate
# - loan duration in months
# - monthly payment

# Mortgage Calculator Formula
# m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

# Steps:
# get 3 inputs and set as variables
# Validate inputs and loop if invalid
# set monthly payment as result of loan calculation
# print monthly_payment
# format results

MONTHS_IN_YEAR = 12

puts 'Welcome to Loan Calculator!'

def prompt(message)
  puts "=> #{message}"
end

def request_input(message, type)
  input = ''
  loop do
    prompt(message)
    input = gets.chomp
    valid = case type
            when 'float' then valid_currency?(input)
            when 'percent' then valid_percent?(input)
            when 'integer' then valid_months?(input)
            end
    valid ? break : puts("Invalid number")
  end

  case type
  when 'float' then input.to_f
  when 'percent' then input.to_f / 100
  when 'integer' then input.to_i
  end
end

def valid_currency?(input)
  /^\d*\.?\d*$/.match(input) && input.to_f > 0
end

def valid_percent?(input)
  /^\d*\.?\d*$/.match(input) && input.to_f > 0
end

def valid_months?(input)
  /^\d+$/.match(input) && input.to_i > 0
end

def format_currency(input)
  sprintf("$%0.2f", input)
end

def format_percent(input)
  sprintf("%#0.2f%%", input)
end

def format_months(input)
  sprintf("%d", input)
end

loan_amount = request_input('What is your loan amount? (positive value)', 'float')

loan_apr = request_input('What is the Annual Percentage Rate "APR" (%)?', 'percent')

loan_term_months = request_input('What is the loan term (months)?', 'integer')

# loan_monthly_rate = (1 + loan_apr)**(1.0 / 12) - 1

loan_monthly_rate = loan_apr / MONTHS_IN_YEAR

monthly_payment = loan_amount * (loan_monthly_rate / (1 - (1 + loan_monthly_rate)**(-loan_term_months)))

prompt("with a loan amount of #{format_currency(loan_amount)}, an APR of #{format_percent(loan_apr * 100)}, and a loan duration of #{format_months(loan_term_months)} months, your monthly payment will be: #{format_currency(monthly_payment)}")
