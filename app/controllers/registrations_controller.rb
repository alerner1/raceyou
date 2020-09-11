class RegistrationsController < ApplicationController
  before_action :find_registration, only: [:edit, :destroy, :update]
  
  # not actually sure if this is necessary
  def new
    @registration = Registration.new
  end

  def create
    #byebug
    @registration = Registration.create(registration_params(:runner_id, :race_id))
    
    if @registration.valid?
      flash[:success] = "You have been signed up for this race!"
      redirect_to race_path(Race.find(@registration.race_id))
    else
      flash[:errors] = @registration.errors.full_messages
      flash[:params] = params
      redirect_to(request.referer)
    end
  end

  def edit
  end

  def update
    if @registration.update(registration_params(:completed, :finish_time_mins, :finish_time_secs))
      redirect_to race_path(@registration.race)
    else
      flash[:errors] = @registration.errors.full_messages
      redirect_to edit_registration_path(@registration)
    end 
    
  end 

  def destroy
    @registration.destroy
    flash[:success] = "You have been removed from this race."
    redirect_to(request.referer)
  end

  private

  def find_registration
    @registration = Registration.find(params[:id])
  end

  def registration_params(*args)
    params.require(:registration).permit(*args)
  end
end