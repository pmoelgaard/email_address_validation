require 'dotenv'
require 'email_address_validation'

# Load Environment Variables
Dotenv.load

# Declare the Client instance passing in the authentication parameters
@client = MailboxLayer::Client.new(ENV['ACCESS_KEY'])

# Set the email to check, we take a random email
email = 'test@test.com'

# We declare the options
options = MailboxLayer::CheckOptions.new()

# We make the call to check
response = @client.check(email, options)

# If its a success, we print a message to the user
if ! response.nil?
  puts 'SUCCESS : Email checked...' << response.length.to_s
end