require File.join(File.dirname(__FILE__), 'test_helper.rb')

class AnyApiTest < Minitest::Test


  def test_connection
     response = AnyApi::Request.new( "Get", 'tickets.json')
      #p response
      #p response.apiresult.body
      p response.parser_response

      assert_equal  "200", response.apiresult.code
      assert response.is_ok?
   end


   def test_faliour

     AnyApi.configure do |config|
       config.api_base_url =  "https://iamfree.com/api/v1"
     end
     response = AnyApi::Request.new( "Get", 'hello.json')
     p response.parser_response
     refute response.is_ok? 
   end

end
