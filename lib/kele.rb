class Kele
  require 'httparty'
  include HTTParty

  def initialize(email, password)
    @base_url = 'https://www.bloc.io/api/v1'
    response = self.class.post('sessions', body: { "email":email, "password":password} )
    raise response.message
    @auth_token = response["auth_token"]
  end
end
