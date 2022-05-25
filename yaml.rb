require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

puts messages('welcome', 'en')
puts messages('welcome', 'es')