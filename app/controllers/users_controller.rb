class UsersController < ActionController::Base


  def index
    @users = User.order(:id).page(params[:page])
  end


  def posts
    @user = User.find(params[:id])
    @posts = @user.posts
  end

end
