require 'rails_helper'


describe Message, :vcr => true do
  it { should validate_presence_of :from }
  it { should validate_presence_of :to }
  it { should validate_presence_of :body }

  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => ['11111'], :from => '8327722065')
    message.save.should be false
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'hi', :to => ['11111'], :from => '8327722065')
    message.save
    message.errors[:base].should eq ["The 'To' number 11111 is not a valid phone number."]
  end
end
