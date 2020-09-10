class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :login]

  def new
  end

  def login
    runner = Runner.find_by(email: params[:session][:email])

    if runner && runner.authenticate(params[:session][:password])
      session[:runner_id] = runner.id
      redirect_to runner_path(runner)
    else
      flash[:error] = "Username or Password Incorrect"
      redirect_to new_login_path
    end
  end

  def logout
    session.delete(:runner_id)

    redirect_to runners_path
  end
end