require "httparty"
require "hashable"
require "email_address_validation/version"

module MailboxLayer

  class Client

    include HTTParty

    base_uri 'apilayer.net/api'

    def initialize(access_key)

      if access_key.nil?
        raise MailboxLayer::MissingArgumentException.new 'access_key'
      end

      @access_key = access_key

    end


    def check(email, options = {})

      if email.nil?
        raise MailboxLayer::MissingArgumentException.new 'email'
        return
      end

      # Create a shallow copy so we don't manipulate the original reference
      query = options.dup

      # Populate the Query
      query.access_key = @access_key
      query.email = email

      # We then create the Request
      req = CheckRequest.new(query)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/check', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        # We just return the parsed binary response
        return res.parsed_response

      rescue => e
        puts e.inspect
        return

      end
    end
  end


  class CheckRequest

    include Hashable

    attr_accessor :query

    def initialize(query = {})
      self.query = query;
    end

  end


  class CheckOptions

    include Hashable

    attr_accessor :access_key

    attr_accessor :email

    attr_accessor :smtp
    attr_accessor :format
    attr_accessor :smtp_check
    attr_accessor :catch_all

    def initialize()
      @query = nil
    end

  end


  class CheckResponse

    SUCCESS_EXPR = 'success'
    INFO_EXPR = 'info'

    def bar
      SUCCESS_EXPR
      INFO_EXPR
    end

  end

end
