# make the prompt user friendly
# ask the user for two numbers
# validate each number, if not valid ask to enter again
# as the user for an operation to perform
# validate the operator
# perform the operation on the two numbers
# output the result
# ask the user if he/she wants to do more calculation

# use require to import module
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# LANGUAGE = 'en'

# def messages(message, lang='en')
#   MESSAGES[lang][message]
# end

# def prompt(key)
#   message = messages(key, LANGUAGE)
#   Kernel.puts("=> #{message}")
# end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  if num.start_with?('0')
    true
  else
    num.to_i() != 0
  end
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def number?(input)
  valid_number?(input) || float?(input)
end

def operation_to_message(operator)
  word = case operator
         when '1'
           'Adding'
         when '2'
           'subtracting'
         when '3'
           'multiplying'
         when '4'
           'dividing'
         end

  word
end

prompt(MESSAGES['welcome'])
name = ''

loop do
  name = Kernel.gets.chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi, #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  operator_prompt = <<-MSG
What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}")
  prompt(MESSAGES['calculate_again'])
  answer = Kernel.gets().chomp().downcase()
  break unless answer.start_with?('y')
end

prompt(MESSAGES['thank_you'])
