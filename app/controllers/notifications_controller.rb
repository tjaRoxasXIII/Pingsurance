require 'twilio-ruby'
class NotificationsController < ApplicationController

    skip_before_action :verify_authenticity_token
  
    def notify
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']
        client = Twilio::REST::Client.new(account_sid, auth_token)
        message = client.messages.create from: '+14157809076', to: '+18018508653', body: 'Learning to send SMS you are.'
        render plain: message.status
    end
  
end