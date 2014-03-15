module T411
  module Bookmarks
  extend self
    def self.list
    T411::Api.request_data(URI.parse($t411_base_url + '/bookmarks'))
    end

    def self.save(id)
      T411::Api.request_data(URI.parse($t411_base_url + "/bookmarks/save/#{id}"))
    end

    def self.delete(id)
      T411::Api.request_data(URI.parse($t411_base_url + "/bookmarks/delete/#{id}"))
    end
  end
end
