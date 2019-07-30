MESSAGE = {
  welcome: "Welcome to Loan Calculator",
  amount: "What is the loan amount?",
  rate: "What is the Anual Percentage Rage (APR)? (enter 5 for 5%)",
  duration: "What is the loan duration in years?",
  invalid_amount: "Please enter a correct loan amount e.g. 100000",
  invalid_rate: "Please enter a correct rate (5 for 5% or 3.4 for 3.4%)",
  invalid_term: "Please enter a valid term between 1 and 30 years",
  calculate_again: "Would you like to calculate another mortgage? (y or n)",
  thank_you: "Thank you for using the Loan Calculator"
}

#  helper methods
def valid_integer(input)
  # should not start with 0
  /^[1-9]\d*$/.match(input)
end

def float?(input)
  /\A[+-]?\d+(\.[\d]+)?\z/.match(input)
end

def prompt(message)
  puts "=> #{message}"
end

def monthly_payment(amount, mar, term_in_months)
  if mar == 0
    amount / term_in_months
  else
    amount * (mar / (1 - (1 + mar)**-term_in_months))
  end
end

def valid_amount?(amount)
  valid_integer(amount)
end

def valid_rate?(rate)
  float?(rate)
end

def valid_term?(term)
  valid_integer(term) && term.to_i >= 1 && term.to_i <= 30
end

def loan_amount
  loan_amount = ''
  loop do
    prompt(MESSAGE[:amount])
    loan_amount = gets.chomp
    break if valid_amount?(loan_amount)
    prompt(MESSAGE[:invalid_amount])
  end
  loan_amount.to_i
end

def annual_rate
  annual_rate = ''
  loop do
    prompt(MESSAGE[:rate])
    annual_rate = gets.chomp
    break if valid_rate?(annual_rate)
    prompt(MESSAGE[:invalid_rate])
  end
  annual_rate.to_f
end

def loan_term
  term_in_years = ''
  loop do
    prompt(MESSAGE[:duration])
    term_in_years = gets.chomp
    break if valid_term?(term_in_years)
    prompt(MESSAGE[:invalid_term])
  end
  term_in_years.to_i
end

def display_result(loan_amount, annual_rate, term_in_years)
  monthly_rate = annual_rate / 100 / 12
  term_in_months = term_in_years * 12
  monthly_payment = monthly_payment(loan_amount, monthly_rate, term_in_months)
  total_payment = (term_in_months * monthly_payment).round(2)
  total_interest = (total_payment - loan_amount).round(2)

  prompt("Your Loan Amount: $#{loan_amount}")
  prompt("Your annual interest rate (APR): #{annual_rate}%")
  prompt("Monthly Payment: $#{monthly_payment.round(2)}")
  prompt("Time required to Payoff debt: #{term_in_years} years")
  prompt("Total of #{term_in_months} Payments: $#{total_payment}")
  prompt("Total Interest: $#{total_interest.round(2)}")
end

prompt(MESSAGE[:welcome])
loop do # main loop
  amount = loan_amount
  rate = annual_rate
  term = loan_term
  display_result(amount, rate, term)
  puts "_" * 20
  prompt(MESSAGE[:calculate_again])
  answer = gets.chomp.downcase
  break unless answer == 'yes' || answer == 'y'
  system('clear')
end

prompt(MESSAGE[:thank_you])
