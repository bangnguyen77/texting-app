class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contacts = Contact.all
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Your contact was saved!"
      respond_to do |format|
        format.html { redirect_to contacts_path }
        format.js
      end
    else
      render 'new'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end
