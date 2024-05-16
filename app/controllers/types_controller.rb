require 'net/http'

class TypesController < ApplicationController
    def index
        uri = URI("https://api.shadeform.ai/v1/instances/types")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        params = {'X-API-KEY': ENV['API-KEY']}
        uri.query = URI.encode_www_form(params)
      
        res = Net::HTTP::get_response(uri)
      
        
        body = JSON.parse(res.body)
        print(body)
        @types = body
        render json: @types
    end

end