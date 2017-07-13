require './lib/roadmap'
require 'httparty'
require 'json'

class Kele
  include HTTParty
  include JSON
  include Roadmap

  def initialize(email, password)
    @base_uri = 'https://www.bloc.io/api/v1'
    response = self.class.post('https://www.bloc.io/api/v1/sessions', body: { "email":email, "password":password} )
    raise response.message if response.code == 400
    @auth_token = response["auth_token"]
  end

  def get_me
    # my id 2350193
    response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: { "authorization" => @auth_token } )
    @me = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
  # mentor id 2344341
    response = self.class.get("https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token } )
    availability = []
    response.each do |time|
      if time["booked"] == nil
        availability << time
      end
    end
    availability
  end

  def get_messages
    response = self.class.get('https://www.bloc.io/api/v1/message_threads', headers: { "authorization" => @auth_token } )
    @messages = JSON.parse(response.body)
  end

  def create_message(sender_email, recipient_id, subject, stripped_text)
    body = {
      "sender": sender_email,
      "recipient_id": recipient_id,
      "subject": subject,
      "stripped-text": stripped_text
    }
    response = self.class.post('https://www.bloc.io/api/v1/messages', headers: { "authorization" => @auth_token }, body: body)
  end
end
