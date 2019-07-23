# I will need three pieces of information
#   - the loan amount
#   - the annual Percentage Rate (APR)
#   - the loan duration

# I need to calculate
#   - monthly interest rate
#   - loan duration in months

#  Formula:
# m = p * (j /(1- (1 + j)**(-n)))
# m = mothly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in moths

# messages
MESSAGE = {
  welcome: "Welcome to Loan Calculator",
  amount: "What is the loan amount?",
  rate: "What is the Anual Percentage Rage (APR)? (enter 5 for 5%)",
  duration: "What is the loan duration in years?",
  invalid_number: "Please enter a valid positive number",
  thank_you: "Thank you for using the Loan Calculator"
}

#  helper methods
def valid_number?(input)
  input.to_i != 0
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def number?(input)
  valid_number?(input) || float?(input)
end

def prompt(message)
  puts "=> #{message}"
end

def monthly_payment(amount, mar, term_in_months)
  if mar == 0
    amount.to_f / term_in_months
  else
    amount.to_f * (mar / (1 - (1 + mar)**-term_in_months))
  end
end

prompt(MESSAGE[:welcome])
loop do # main loop
  loan_amount = ''
  loop do
    prompt(MESSAGE[:amount])
    loan_amount = gets.chomp
    if number?(loan_amount)
      break
    else
      prompt(MESSAGE[:invalid_number])
    end
  end
  annual_rate = ''
  loop do
    prompt(MESSAGE[:rate])
    annual_rate = gets.chomp
    if number?(annual_rate)
      break
    else
      prompt(MESSAGE[:invalid_number])
    end
  end
  term_in_years = ''
  loop do
    prompt(MESSAGE[:duration])
    term_in_years = gets.chomp
    if number?(term_in_years)
      break
    else
      prompt(MESSAGE[:invalid_number])
    end
  end

  monthly_rate = annual_rate.to_f / 100 / 12
  term_in_months = term_in_years.to_f * 12
  monthly_payment = monthly_payment(loan_amount, monthly_rate, term_in_months)
  total_payment = (term_in_months.to_f * monthly_payment).round(2)
  total_interest = (total_payment - loan_amount.to_f).round(2)

  if term_in_years == '0'
    puts "#{loan_amount} immidiately "
  else
    puts "Your Loan Amount: $#{loan_amount}"
    puts "Your annual interest rate (APR): #{annual_rate}%"
    puts "Monthly Payment: $#{monthly_payment.round(2)}"
    puts "Time required to Payoff debt: #{term_in_years} years"
    puts "Total of #{term_in_months} Payments: $#{total_payment}"
    puts "Total Interest: $#{total_interest.round(2)}"
  end

  puts "_" * 20
  puts "Would you like to calculate another mortgage? (y or n)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt(MESSAGE[:thank_you])
