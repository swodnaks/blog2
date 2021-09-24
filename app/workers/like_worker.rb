class LikeWorker
  include Sidekiq::Worker

  def perform(*args)
    @post.likes.create(user_id: current_user.id) 
  end
end
