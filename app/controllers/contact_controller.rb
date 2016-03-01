class ContactController < ApplicationController
  def index
    render 'contact/index'
  end

  def new
    redirect_to :success
  end

  def success
    render 'contact/success'
  end
end
