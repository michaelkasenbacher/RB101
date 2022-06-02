require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

puts MESSAGES['welcome']
puts MESSAGES['first_number']
