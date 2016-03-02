class ActivityController < ApplicationController
  def new
    activity = Activity.new activity_params

    if activity.invalid?
      errors = activity.errors.full_messages.join ', '
      return render json: errors, status: 406
    end

    activity.save
    render json: activity, status: 202
  end

  def find
    @activities = Activity.where(cid: params[:cid]).order(id: :desc).all
    render 'activity/index'
  end

  private

  def activity_params
    session[:id] ||= SecureRandom.uuid
    activity = params.permit :name, :reference
    activity[:cid] = session[:id]
    activity
  end
end
