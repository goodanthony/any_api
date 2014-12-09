require File.join(File.dirname(__FILE__), 'test_helper.rb')

class AnyApiTest < Minitest::Test


  def test_connection
     response = AnyApi::Request.new('/tickets.json', "Get")
      #p response
      #p response.apiresult.body
      p response.parser_response
      assert_equal  "200", response.apiresult.code
   end


end
