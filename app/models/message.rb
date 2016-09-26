class Message < ActiveRecord::Base
  before_create :send_sms
  validates :from, :to, :body, :presence => true

  private

    def send_sms
      response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC39a7a985f195db512a88b93ca2884057/Messages.json',
      :user => 'AC39a7a985f195db512a88b93ca2884057',
      :password => 'c007b6123d962dd539bcbdab8790ef3b',
      :payload => { :Body => body,
                    :From => from,
                    :To => to}
      ).execute
    end


end
