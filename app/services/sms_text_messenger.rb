class SmsTextMessenger
  attr_reader :message

  def initialize(message, phone)
    @message = message
    @phone = phone
  end

  def client 
    Twilio::REST::Client.new
  end

  def call
    client.messages.create({
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: @phone,
      body: @message
    })
  end

  private 
  attr_reader :phone, :message
end