class Message < ActiveRecord::Base
  belongs_to :contact
  before_create :send_sms
  validates :from, :to, :body, :presence => true

  private

    def send_sms
      begin
        response = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.twilio.com/2010-04-01/Accounts/AC39a7a985f195db512a88b93ca2884057/Messages.json',
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => body,
                      :From => from,
                      :To => to}
        ).execute
      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        throw(:abort)
      end
    end

end
