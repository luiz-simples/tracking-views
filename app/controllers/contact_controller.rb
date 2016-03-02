class ContactController < ApplicationController
  def index
    render 'contact/index'
  end

  def fail
    render 'contact/fail'
  end

  def success
    render 'contact/success'
  end

  def find
    @contacts = Contact.all
    render 'contact/contacts'
  end

  def new
    contact = Contact.new contact_params

    if contact.invalid?
      errors = contact.errors.full_messages.join ', '
      return redirect_to :fail, :flash => { :alert => errors }
    end

    contact.save

    redirect_to :success
  end

  private

  def contact_params
    session[:id] ||= SecureRandom.uuid
    contact = params.permit :name, :email, :message
    contact[:cid] = session[:id]
    contact
  end
end
