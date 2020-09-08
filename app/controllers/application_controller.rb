class ApplicationController < ActionController::Base
  before_action :authorized

  def current_user
    @current_user = Runner.find_by(id: session[:runner_id])
  end

  def authorized
    redirect_to new_login_path unless current_user
  end
end
