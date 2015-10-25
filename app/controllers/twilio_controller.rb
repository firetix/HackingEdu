class TwilioController < ApplicationController

  def process_sms
    # put your own credentials here
    account_sid = 'AC6e57a00cb04e53984426080830dd3d39'
    auth_token = '2f7df025420c146adc7b622bed6da563'
    message  = 'Hey Mohamed can you please assist armaiz with Who vs. Whom Video this is your favorite tech savy teacher'
    if params[:message]
      message = params[:message]
    end
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: '+16509008056',
      to: '+19166269751',
      body: message
    )
  end

end