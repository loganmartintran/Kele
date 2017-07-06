class Kele
  require 'httparty'
  include HTTParty

  def initialize(email, password)
    @base_url = 'https://www.bloc.io/api/v1'
    response = self.class.post('https://www.bloc.io/api/v1/sessions', body: { "email":email, "password":password} )
    puts response
    raise response.message if response.code == 404
    @auth_token = response["auth_token"]
  end
end
