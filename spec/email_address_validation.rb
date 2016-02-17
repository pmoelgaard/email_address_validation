require 'json'
require 'dotenv'
require 'spec_helper'
require 'email_address_validation'


# Load Environment Variables
Dotenv.load


RSpec.configure do |c|
  # declare an exclusion filter
  c.filter_run_excluding :ci => ENV['CONTEXT'] == 'travis-ci'
end


describe MailboxLayer do


  it 'has a version number' do
    expect(MailboxLayer::VERSION).not_to be nil
  end


  it 'check (simple)' do

    begin

      # Declare the Client instance passing in the authentication parameters
      @client = MailboxLayer::Client.new(ENV['ACCESS_KEY'])

      # Set the email to check
      email = 'test@test.com'

      # We declare the options
      options = MailboxLayer::CheckOptions.new()

      # We make the call to check
      response = @client.check(email, options)

      # First we check the response
      expect(response).not_to be nil

    rescue => e
      puts e.inspect

    end

  end

end




