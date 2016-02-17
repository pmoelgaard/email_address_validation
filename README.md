[![Travis](https://travis-ci.org/pmoelgaard/email_address_validation.svg)](Travis)

# email_address_validation

Ruby Library for the mailboxlayer API, a web service that email validation & verification, [https://mailboxlayer.com/](https://mailboxlayer.com/)   

Simple and powerful email verification JSON API using SMTP, typo checks, syntax validation, and free and disposable provider filtering. Free for personal use.

---

## Installation

Add this line to your application's Gemfile:

```
gem 'email_address_validation'

```

And then execute:

```
$ bundle

```

Or install it yourself as:

```
$ gem install email_address_validation

```

---

## Configuration

Before using the mailboxlayer API client you have to setup your account and obtain your API Access Key.  
You can get it by signing up at [https://mailboxlayer.com/product](https://mailboxlayer.com/product).

---

## API Overview
All endpoints in the public API is available through this library.

- check

---

## Usage

The general API is documented here: [https://mailboxlayer.com/documentation](https://mailboxlayer.com/documentation).  
You can find parameters, result set definitions and status codes documented here as well.

In the examples directory you can find demos and samples of general usage of all the API functions.

### Setup

```
@client = MailboxLayer::Client.new( [access_key] )

```

#### Required Parameters

###### access_key
Your unique key that you can find on the dashboard of your account under the mailboxlayer account.

#### Optional Parameters

###### Secure (only available for Basic, Pro and Enterprise accounts)
Boolean value to indicate if the calls to the API should use a secure protocol or insecure (HTTP/HTTPS). Defaults to false (HTTP, insecure).

---

## Check (simple case)

Takes a URL and returns the captured image.

###### Define Query
Second we define an options object.
All the options are documented here: [https://mailboxlayer.com/documentation](https://mailboxlayer.com/documentation)

```
options = MailboxLayer::CheckOptions.new()

```

###### Call Client
We then place the actual call to the API, passing in the email we wish to check and the options we defined above.

```
response = @client.check( [email] [, options] )

``` 

###### Response

If we pass the email ```test@test.com``` as the email argument above, we get the following result:

```
{
  "email": "test@test.com",
  "did_you_mean": "test@me.com",
  "user": "test",
  "domain": "test.com",
  "format_valid": true,
  "mx_found": nil,
  "smtp_check": false,
  "catch_all": nil,
  "role": false,
  "disposable": false,
  "free": false,
  "score": 0.32
}

```

---

## Example Application

In the [rootdir]/example directory there is a fully functional application which runs all requests against all the endpoints in the API, the examples above can be seen there as source code.

The example application uses a process.env variable to hold the access key.

---

## Tests

The tests are written using the rspec testing library.  
**RSpec** [http://rspec.info/](http://rspec.info/)

In order to run the tests, the following environment variables needs to be set:

```
ACCESS_KEY = [access_key]
```


---

## Customer Support

Need any assistance? [Get in touch with Customer Support](mailto:support@apilayer.net?subject=%mailboxlayer%5D).

---

## Updates
Stay up to date by following [@apilayernet](https://twitter.com/apilayernet) on Twitter.

---

## Legal

All usage of the languagelayer website, API, and services is subject to the [pdflayer Terms & Conditions](https://pdflayer.com/terms) and all annexed legal documents and agreements.

---

## Author
Peter Andreas Moelgaard ([GitHub](https://github.com/pmoelgaard), [Twitter](https://twitter.com/petermoelgaard))

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2016 Peter Andreas Moelgaard & apilayer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

