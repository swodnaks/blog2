class LikesController < ApplicationController
   before_action :find_post
    def create
    #тут GenerateLikesJob.perform_later
    if already_liked?
       flash[:notice] = "You can't like more than once"
     else
    if own_like
       flash[:notice] = "You can't like your own post"
    else
       @post.likes.create(user_id: current_user.id)
    end
     redirect_to post_path(@post)
    end
  end

  private

  def already_liked?
     Like.where(user_id: current_user.id, post_id:
     params[:post_id]).exists?
  end

  def find_post
     @post = Post.find(params[:post_id])
  end



  def own_like
     Like.find_by(user_id: @post.user_id == current_user.id , post_id:
     @post.user_id)
  end
end
