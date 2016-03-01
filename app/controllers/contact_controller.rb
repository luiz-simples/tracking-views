class ContactController < ApplicationController
  def index
    render 'contact/index'
  end

  def new
    contact = Contact.new contact_params

    if contact.invalid?
      erros = contact.errors.full_messages.join(', ')
      flash[:alert] = erros
      return index
    end

    redirect_to :success
  end

  def success
    render 'contact/success'
  end

  private

  def contact_params
    params.permit(:name, :email, :message)
  end
end
