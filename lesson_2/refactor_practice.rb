# ask the user for two numbers
# validate each numbers after they are entered
# ask for operation
# perform operation on the two numbers
# display the result
# ask the user if they want to calculate again

# methods
def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(operator)
  case operator
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# welcome and greet the user
prompt("Welcome to the calculator, Enter your name:")
name = ""
loop do
  name = gets.chomp
  if name.empty?
    puts "Make sure the is valid"
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  # ask for numbers
  prompt("What is the first number?")
  number1 = ''
  loop do
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  prompt("What is the second number?")
  number2 = ''
  loop do
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  # ask for the operation
  prompt_message = <<-MSG
  What operation would you like to perfomr?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(prompt_message)
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Enter 1, 2, 3 or 4")
    end
  end

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("#{operation_to_message(operator)} the two numbers")
  prompt("The result is #{result}")

  prompt("Do you want to calculate again? (Y to calculate again)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thank you for using the calculator. Good Bye!")
