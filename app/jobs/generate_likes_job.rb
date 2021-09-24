class GenerateLikesJob < ApplicationJob
  queue_as :default

  def perform
    sleep 1
    @post.likes.create(user_id: current_user.id)
  end

end
