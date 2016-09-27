class Message < ActiveRecord::Base
  before_create :send_sms
  validates :from, :to, :body, :presence => true

  private

    def send_sms
      begin
        JSON.parse(to).each do |recipient|
          response = RestClient::Request.new(
          :method => :post,
          :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
          :user => ENV['TWILIO_ACCOUNT_SID'],
          :password => ENV['TWILIO_AUTH_TOKEN'],
          :payload => { :Body => body,
                        :From => from,
                        :To => recipient}
          ).execute
        end
      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        throw(:abort)
      end
    end

end
