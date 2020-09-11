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
    if params[:runner][:photo] == ""
      params[:runner][:photo] = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
    end
    params[:runner][:rank_category_id] = Runner.categorize_on_signup(params[:runner][:five_k_mins], params[:runner][:five_k_secs])
    params[:runner][:points] = Runner.assign_initial_points(params[:runner][:rank_category_id])

    @runner = Runner.create(runner_params(:username, :email, :password, :name, :age, :gender, :rank_category_id, :five_k_mins, :five_k_secs, :points, :photo))
    
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

  def update
    if @runner.update(runner_params(:username, :email, :password, :name, :gender, :points, :photo))
      redirect_to runner_path(@runner)
    else
      flash[:errors] = @runner.errors.full_messages
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