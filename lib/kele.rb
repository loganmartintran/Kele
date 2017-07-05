class Kele
  require 'httparty'
  include HTTParty

  def initialize(email, password)
    @base_uri = 'https://www.bloc.io/api/v1'
    response = self.class.post('https://www.bloc.io/api/v1/sessions', { "email":email, "password":password} )
    raise 'Invalid credentials' if response.code == 404
    @auth_token = response["auth_token"]
  end
end
