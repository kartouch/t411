module T411
  module Torrents
    extend self

    %w(categories terms).each do |request|
      define_method(:"#{request}") {T411::Api.request_data(URI.parse($t411_base_url + "/#{request}/tree"))}
    end

    def self.search(query, limit = 100)
      uri = URI.join($t411_base_url, '/torrents/','search/',"#{query.gsub(' ','+')}","?&limit=#{limit}")
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Get.new("/torrents/search/#{query.gsub(' ','+')}?&limit=#{limit}")
      req['Authorization'] = T411::Api.shared_token
      http.request(req).body
    end

    def self.search_with_category_id(query,cid,limit = 100)
      uri = URI.join($t411_base_url, '/torrents/','search/',"#{query.gsub(' ','+')}","?&cid=#{cid}&limit=#{limit}")
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Get.new("/torrents/search/#{query.gsub(' ','+')}?&cid=#{cid}&limit=#{limit}")
      req['Authorization'] = T411::Api.shared_token
      http.request(req).body
    end

    def self.details(id)
      T411::Api.request_data(URI.parse($t411_base_url + "/torrents/details/#{id}"))
    end

    def self.download(id,path = Dir.pwd)
      File.open("#{path}/#{id}.torrent", 'a+') do |line|
        line.puts T411::Api.request_data(URI.parse($t411_base_url + "/torrents/download/#{id}"))
      end
    end

    def self.top100
      T411::Api.request_data(URI.parse($t411_base_url + '/torrents/top/100'))
    end

    %w(today month).each do |request|
      define_method(:"#{request}") {T411::Api.request_data(URI.parse($t411_base_url + "/torrents/top/#{request}"))}
    end
  end
end



