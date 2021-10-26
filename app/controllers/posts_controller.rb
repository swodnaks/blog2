class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all_by_tags(params[:tag_ids])
    @posts= Post.all_by_tags(params[:tag_ids])
  end


  def new
    @post = Post.new
  end


  def create
    @post = Post.new(posts_params)

    @post.user_id = current_user.id

  if @post.save
      redirect_to @post
  else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  

  def edit
    @post = Post.find(params[:id])
  end





  def update
    @post = Post.find(params[:id])

  if @post.update(params[:post].permit(:tittle, :body))
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to posts_path
end
  private
    def posts_params
      params.require(:post).permit(:title, :body, tag_ids: [])
    end
end
