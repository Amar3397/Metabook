class FriendshipsController < ApplicationController
	 before_action :find_friendship, only: [:destroy]

	def new
		@friendship= Friendship.new
    end

  	def create  
    	@friendship = current_user.friendships.new(:friend_id => params[:friend_id], friendship_status: false )  
    	if @friendship.save  
      		flash[:notice] = "Added friend."  
      		redirect_to users_path  
    	else  
      		flash[:notice] = "Unable to add friend."  
      		redirect_to users_path
    	end  
  	end 

  	

  	def destroy
   	 if @friendship_id
      @friendship_id.destroy
      flash[:success] = 'Friendship request canceled'
      redirect_to users_path
    else
      flash[:danger] = 'Friendship request not canceled'
    end
  end

  private

  def find_friendship
    @friendship_id = Friendship.find(params[:id])
  end

  	
end
