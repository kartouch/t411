require 'net/http'
require 'open-uri'
require 'json'

module T411
  module Api
     extend self
    attr_accessor :token
    $t411_base_url = 'http://api.t411.in'

    def self.connect(username,password)
      uri = URI.parse($t411_base_url + "/auth")
      response = Net::HTTP.post_form(uri, {username: username, password: password})
      @token = JSON.parse(response.body)['token']
    end

     def self.request_data(uri,token = @token)
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Get.new(uri.path)
      req['Authorization'] = token
      http.request(req).body
     end

    def self.shared_token
      @token
    end
  end
end
