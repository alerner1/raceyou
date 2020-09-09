class RunnersController < ApplicationController
  before_action :find_runner, only: [:show, :edit, :update, :destroy]
  # won't show profile page without login, may change this later
  skip_before_action :authorized, only: [:new, :create, :index]

  # should be able to: 
  # see a list of all runners
  # new/create a new runner (by signing up)
  # edit/update certain attributes
  # show the runner's profile page (different aspects depending if signed in?)
  # delete account

  # works, can view without login
  def index
    @runners = Runner.all
  end

  def new
    @runner = Runner.new
  end

  
  def create
    @runner = Runner.create(runner_params(:username, :email, :password, :name, :age, :gender, :rank_category_id))
    
    if @runner.valid?
      session[:runner_id] = @runner.id

      flash[:success] = "Your account has been created!"
      redirect_to runner_path(@runner)
    else
      flash[:errors] = @runner.errors.full_messages
      flash[:params] = params
      redirect_to new_runner_path
    end
  end

  def edit
  end

  # what should we be able to edit? 
  # username, email, password, name, gender? just restrict age?
  def update
    if @runner.update(runner_params(:username, :email, :password, :name, :gender))
      redirect_to runner_path(@runner)
    else
      flash[:errors] = @snail.errors.full_messages
      flash[:params] = params
      redirect_to edit_runner_path(@runner)
    end
  end

  # works
  def show
  end

  # works
  def destroy
    @runner.destroy

    redirect_to runners_path
  end

  private

  def find_runner
    @runner = Runner.find(params[:id])
  end

  def runner_params(*args)
    params.require(:runner).permit(*args)
  end
end