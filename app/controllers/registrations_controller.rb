class RegistrationsController < ApplicationController
  before_action :find_registration, only: :destroy

  # not actually sure if this is necessary
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.create(registration_params)
    
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
    if @registration.update(registration_params)
      redirect_to runner_path(@runner)
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

  def registration_params
    params.require(:registration).permit(:race_id, :runner_id)
  end
end