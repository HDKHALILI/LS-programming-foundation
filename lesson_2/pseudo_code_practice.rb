# a method that returns the sum of two integers
=begin
START
# Given two integers
SET number1 = the first integer
SET number2 = the second integer
SET sum = READ number1 + READ number2
PRINT sum
END
=end

# a method that takes an array of strings, and returns a string that is all those strings concatenated together
=begin
START
# Given a collection of strings called "strings"
SET iterator = 0
SET joined_string = empty string

WHILE iterator < string's length
  SET current_string = a value from within "strings" at location of iterator
  joined_string = joined_string + current_string
  iterator = iterator + 1

PRINT joined_string
END
=end

# a method that takes an array of integers, and returns a new array with every other element
=begin
START

# Given a collection of integers called 'numbers'
SET iterator = 0
SET new_array = empty array
WHILE iterator < numbers' length
  SET current_number = a value from within 'numbers' at location of iterator
  add current_number to new_array
  iterator = iterator + 2

PRINT new_array
END
=end