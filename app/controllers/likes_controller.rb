class LikesController < ApplicationController
  before_action :find_post

  def create

    if already_liked?
      flash[:notice] = "You can't like more than once"
    elsif current_user.id == @post.user_id
      flash[:notice] = "You can't like your own post"
    else
      GenerateLikesJob.perform_later(current_user.id, params[:post_id]) #@post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
