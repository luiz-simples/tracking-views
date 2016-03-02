class ActivityController < ApplicationController
  def new
    activity = Activity.new activity_params
    render json: {}, status: 406 if activity.invalid?
    render json: activity.save, status: 202
  end

  def find
    @activities = Activity.where(cid: params[:cid]).order(id: :desc).all
    render 'activity/index'
  end

  private

  def activity_params
    params.permit :name, :cid, :reference
  end
end
