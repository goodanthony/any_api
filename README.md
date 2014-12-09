# AnyApi is  the worlds smallest API client :-)

Decided to share this thanks to some research I did on APIs. Most of them have a base URL, then API endpoint, API username, a API password and transmits data in form of JSON. Then there are requests and responses. This could be a simple solution to access and work with a big or small APIs.

Please give Ruby's Net::HTTP Library a go. That is the backbone behind this.  Net::HTTP simple, does the job, it is fast and build on top Ruby's IO so straight to the point.

## Installation


```ruby
gem 'any_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install any_api

## Usage


If you are going to use this with Rails. Add bellow code your application.rb file, or the application_controller.rb file or as an initialiser file. It would work fine with any other Ruby project.

```ruby
AnyApi.configure do |config|
  config.username =  "me@example.com"
  config.password =  "my-sectret-password"
  config.api_base_url =  "https://iamfree.com/api/v1"
  #please dont put a "/" at the end of the api_base_url
end
```

Then you can call any API with  

```ruby
response = AnyApi::Request.new("Get", 'products.json' )
```

The first parameter is the HTTP method. Secondly it is the url endpoint.

If you want to do Post or Update calls please send parameters with your request


```ruby
my_params = {"year"=>"2014", "country"=>"Australia", "first_name"=>"True", "last_name"=>"Colours"}
response = AnyApi::Request.new( "Post", 'users/new', my_params)
```

To parse the response

```ruby
response.parser_response
```

Thanks


## Contributing

1. Fork it ( https://github.com/iamfree-com/any_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
