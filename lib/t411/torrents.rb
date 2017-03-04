module T411
  module Torrents
    extend self

    %w(categories terms).each do |request|
      define_method(:"#{request}") {T411::Api.request_data(URI.parse($t411_base_url + "/#{request}/tree"))}
    end

    %w(today week month top100).each do |request|
      define_method(:"#{request}") {T411::Api.request_data(URI.parse($t411_base_url + "/torrents/top/#{request.gsub('top100','100')}"))}
    end

    def self.search(query, options={})
      options = {limit: 100, cid: nil}.merge(options)
      path = "/torrents/search/#{query.gsub(' ','+')}?&limit=#{options[:limit]}&cid=#{options[:cid]}" if options[:cid] != nil && options[:cid].is_a?(Integer) || path = "/torrents/search/#{query.gsub(' ','+')}?&limit=#{options[:limit]}"
      req = Net::HTTP::Get.new(path); req['Authorization'] = T411::Api.shared_token
      Net::HTTP.new($t411_base_url.gsub('https://','').gsub('http://','')).request(req).body
    end

    def self.details(id)
      T411::Api.request_data(URI.parse($t411_base_url + "/torrents/details/#{id}"))
    end

    def self.download(id,path = Dir.pwd)
      File.open("#{path}/#{id}.torrent", 'ab+') do |line|
        line.puts T411::Api.request_data(URI.parse($t411_base_url + "/torrents/download/#{id}"))
      end
    end

  end
end
