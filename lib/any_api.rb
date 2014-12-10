require 'net/http'
require 'uri'
require 'json'


require_relative "any_api/configuration"

module AnyApi

  class Request

    attr_accessor :apiresult
    HTTPMETHODS = ["Get", "Head", "Post", "Patch", "Put", "Proppatch", "Lock", "Unlock", "Options", "Propfind", "Delete", "Move", "Copy", "Mkcol", "Trace"]

    def initialize(http_method, endpoint, params_hsh = nil)

      uri = URI.parse("#{AnyApi.configuration.api_base_url.to_s.gsub(/\/$/, '')}/#{endpoint}")

      res = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        # a safe eval as only  one of the above HTTPMETHODS would be allowed ie: Get, Put, Post, Delete
        request = eval "Net::HTTP::#{http_method if HTTPMETHODS.include?(http_method)}.new uri"
        request.basic_auth(AnyApi.configuration.username, AnyApi.configuration.password)
        request["Content-Type"] = "application/json"
        if params_hsh
          request.body = params_hsh.to_json
        end
        http.request request
      end

      @apiresult = res
    end


    def parser_response
      case  apiresult
        when Net::HTTPSuccess
          JSON.parse  apiresult.body
        when Net::HTTPUnauthorized
          {'error' => "#{ apiresult.message}: username and password set and correct?"}
        when Net::HTTPServerError
          {'error' => "#{ apiresult.message}: try again later?"}
        else
          {'error' =>  "there seems to be an error in the server, please try again"}
      end
    end


    def is_ok?
      case  apiresult
      when Net::HTTPSuccess
        true
      else
        false
      end

    end



    end

end
