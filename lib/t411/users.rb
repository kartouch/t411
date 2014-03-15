module T411
  module Users
    extend self
    def details(id)
      T411::Api.request_data(URI.parse($t411_base_url + "/users/profile/#{id}"))
    end
  end
end