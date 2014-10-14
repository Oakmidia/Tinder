class FriendsController < ApplicationController
	before_action :authenticate_user!

  def index
  	pick_next_friend
  	# render :index  Automáticamente
  end

  def like
  	friend_id = params[:id]
  	liked 		= params[:liked].present?

  	current_user.likes.create(friend_id: friend_id, liked: liked)
    pick_next_friend
  	render :index
  end

  def nope
  end

  def pick_next_friend
      @friend = User.where.not(id:current_user.id).order("RANDOM()").first
  end
end
 