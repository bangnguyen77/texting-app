class MessagesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  #
  # def reply
  #   message_body = params["Body"]
  #   from_number = params["From"]
  #   boot_twilio
  #   sms = @client.messages.create(
  #     from: Rails.application.secrets.twilio_number,
  #     to: from_number,
  #     body: "Hello there, thanks for texting me. Your number is #{from_number}."
  #   )
  #
  # end

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @contacts = Contact.all
  end

  def create
    @messages = Message.all
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent!"
      respond_to do |format|
        format.html { redirect_to messages_path }
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end

  private
  def message_params
    params.require(:message).permit(:from, :body, to:[])
  end

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end
