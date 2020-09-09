class RegistrationsController < ApplicationController
  
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
    # @snail = Snail.find(params[:id])
    if @registration.update(registration_params)
      redirect_to runner_path(@runner)
    else
      flash[:errors] = @registration.errors.full_messages
      redirect_to edit_registration_path(@registration)
    end 
    
  end 

  private

  def registration_params
    params.require(:registration).permit(:race_id, :runner_id)
  end
end