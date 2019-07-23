# Truthiness
# The ability to express true and false is an important concept in any programming languages.
# It is used to build conditional logic
# "true" or "false" is expressed with boolean data type.
# A boolean is an object whose only purpose is to convery whether it is "true" or "false"

# Examples
if true
  puts "hi"
else
  puts "goodbye"
end
# -> always output "hi"

if false
  puts "hi"
else
  puts "goodbye"
end
# -> always output "goodbye"

# logical operators
# && : is 'and' operator. for this both condition has to be true, then it returns true
if true && true
  puts "hi"
else
  puts "bye"
end
# -> "hi"

if true && false # both must be true
  puts "hi"
else
  puts "bye"
end
# -> "bye"

# short circuiting: && and || operators have a behaviour called short circuiting. They will stop
# evaluating expression once it can guarantee the return value
# && short circuits once it encounters the first 'false' expression
# || short circuits once it encounters the first 'true' expression

# Truthiness
# It is what the language consider to be truthfull and treats it as true
# In Ruby everything is truthy except 'false' and 'nil'
# Note: an expression that Ruby considers true is not the same as 'true' object
puts "hello" == true
# -> false

name = ''
if name && name.valid?
  puts "great name"
else
  puts "invalid name"
end