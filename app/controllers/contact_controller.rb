class ContactController < ApplicationController
  def index
    render 'contact/index'
  end

  def find
    tracking_service = TrackingApi::TrackingService.new host_name
    @contacts = tracking_service.contacts
    render 'contact/list'
  end

  def activities
    tracking_service = TrackingApi::TrackingService.new host_name
    @activities = tracking_service.activities params[:cid]
    render 'contact/activities'
  end

  private

  def host_name
    original_url = request.original_url
    fullpath = request.fullpath
    fullpath = '' if (fullpath == '/')
    original_url.remove fullpath
  end
end
