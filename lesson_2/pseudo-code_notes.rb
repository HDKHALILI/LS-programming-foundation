# pseudo-code is writing code in natural language.
# this helps us load the problem in our mind
# ---
# There are two layers to solving problems:
#  1) The logic problem domain layer.
#  2) The syntactical programming language layer

# Example
# an informal pseudo-code for determining which number is greatest in a collection
# ----
=begin
#Given a collection of integers.

Iterate through the colletion one by one.
  - save the first value as the starting value
  - for each iteration, compare the saved value with the current value.
  - if the saved value is greater, or it's the same
      - move the to the next value in the collection
  - otherwise, if the current value is greater
    - reassign the saved value as the current value

After iterating through the collection, return the saved value.
=end

# using pseudo-code we can focus on logic without worrying about syntax

# To write formal pseudo-code we will use the following keywords:
# keyword           |  meaning
# START             |  start of the program
# SET               |  sets a variable we can use for later
# GET               |  retrieve input from user
# PRINT             |  displays output to user
# READ              |  retrieve value from variable
# IF/ELSE IF/ELSE   |  show conditional branches in logic
# WHILE             |  show looping logic
# END               |  end of the program

# writing the above pseudo-code formally
=begin

START

# Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator <= length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number
  
  iterator = iterator + 1

PRINT saved_number

END

=end

# Translating Pseudo-Code to Program Code

def find_greatest(numbers)
  saved_number = nil

  numbers.each do |num|
    saved_number ||= num
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end
    
  saved_number
end

numbers = [12, 34, 23, 43, 45, 54, 56, 65, 78, 67, 90]
puts find_greatest(numbers)

# Once we have the working code, then we start to improve the code.
# cover edge cases like what if numbers is nil and etc

# for bigger problems it's not ideal to write the entire logic in pseudo-code
# for more sophisticated problems we need to take a piecemeal approach to applying pseudo-code,
# then translating that to Ruby code to verify the logic is correct, then moving on to the next piece
# in the problem. Step by step, we can slowly load the problem into our brain, verify the logic each
# step along the way.