class FriendshipsController < ApplicationController
  protect_from_forgery with: :exception

  # route: friendships_path (POST)
  def create
    
    @friendship = Friendship.create_reciprocal_for_ids(current_user.id, params[:friendship][:friend_id])
    if @friendship[0].valid? && @friendship[1].valid?
      flash[:success] = "You are now friends!"
      redirect_to(request.referer)
    else 
      flash[:errors] = @friendship[0].errors.full_messages + @friendship[1].errors.full_messages
      flash[:params] = params
      redirect_to(request.referer)
    end
  end

  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user.id, params[:friend_id])
    redirect_to(request.referer)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
