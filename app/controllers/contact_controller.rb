class TrackingService
  include HTTParty
  base_uri 'tracking-server.herokuapp.com'

  def initialize(hid)
    @hid = hid
  end

  def contacts
    self.class.get "/contacts", { query: { hid: @hid } }
  end

  def activities(cid)
    self.class.get "/activities", { query: { hid: @hid, cid: cid } }
  end
end

class ContactController < ApplicationController
  def index
    render 'contact/index'
  end

  def find
    tracking_service = TrackingService.new host_id
    @contacts = tracking_service.contacts
    render 'contact/list'
  end

  def activities
    tracking_service = TrackingService.new host_id
    @activities = tracking_service.activities params[:cid]
    render 'contact/activities'
  end

  private

  def host_id
    original_url = request.original_url
    fullpath = request.fullpath
    fullpath = '' if (fullpath == '/')
    original_url.remove fullpath
  end
end
