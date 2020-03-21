class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
<<<<<<< HEAD
    user = User.find(params[:followed_id])
    current_user.follow(user)
=======
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
>>>>>>> origin/for-work
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
<<<<<<< HEAD
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
=======
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
>>>>>>> origin/for-work
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
  
end
