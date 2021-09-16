class UsersController < ActionController::Base

  def posts
    @user = User.find(params[:id])
    @posts = @user.posts
  end

end
