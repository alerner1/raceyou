class RacesController < ApplicationController
  # don't need to be logged in to view all the races or a race's profile page
  skip_before_action :authorized, only: [:index] 
  before_action :find_race, only: [:show, :destroy, :edit, :update]

  # i don't think you should be able to edit the race, only destroy it 
  # and create a new one
  # otherwise it's not fair to anyone who already signed up

  #works
  def index
    @races = Race.all
  end

  def new
    @race = Race.new
  end

  # works
  def create
    @race = Race.create(race_params)
    
    if @race.valid?
      session[:race_id] = @race.id

      flash[:success] = "Your race has been created!"
      redirect_to race_path(@race)
    else
      flash[:errors] = @race.errors.full_messages
      flash[:params] = params
      redirect_to new_race_path
    end    
  end

  def edit
  end

  def update
    if @race.update(race_params)
      if @race.closed == true
        @race.end_of_race
      end
      redirect_to race_path(@race)
    else
      flash[:errors] = @race.errors.full_messages
      flash[:params] = params
      redirect_to(request.referer)
    end
  end

  # works
  def show
  end

  # definitely need to make it so only the race's creator can destroy it
  # and only if no one else has signed up yet
  # somehow
  # will probably need to add an attr to the race for the owner (runner_id, maybe as an alias or w/e)
  def destroy
    @race.destroy
    
    redirect_to races_path
  end
  

  private

  def find_race
    @race = Race.find(params[:id])
  end

  def race_params
    params.require(:race).permit(:length, :elevation_increase, :elevation_decrease, :expiration_date, :closed, :created_by)
  end
end