class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @recent_logs = current_user.training_logs.includes(:exercise).order(date: :desc).limit(5)
  end
end
