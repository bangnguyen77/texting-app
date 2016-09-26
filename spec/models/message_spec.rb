require 'rails_helper'

describe Message do

  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '11111', :from => '8327722065')
    message.save.should be false
  end
end
