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

  def new
    contact = Contact.new contact_params

    if contact.invalid?
      erros = contact.errors.full_messages.join ', '
      return redirect_to :fail, :flash => { :alert => erros }
    end

    redirect_to :success
  end

  private

  def contact_params
    params.permit :name, :email, :message
  end
end
