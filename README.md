# AnyApi is  the worlds smallest API client :-)

Decided to share this thanks to some research I did on APIs. Most of them has a base URL, then API endpoint, API username and a API password. Then there is request responses. A simple solution to access and work with a big or small APIs.

Please give Ruby's Net::HTTP Library. That is the backbone behind this.  Net::HTTP simple, does the job, it is fast and build on top Ruby's IO so straight to the point.

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
response = AnyApi::Request.new('/products.json', "Get")
```

The first parameter is the url endpoint. Second is the HTTP method.

If you want to do Post or Update calls please send parameters with your request


```ruby
my_params = {"year"=>"2014", "country"=>"Australia", "first_name"=>"True", "last_name"=>"Colours"}
response = AnyApi::Request.new('/users/new', "Post", my_params)
```

To parse the response

```ruby
response
```


## Contributing

1. Fork it ( https://github.com/iamfree-com/any_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
