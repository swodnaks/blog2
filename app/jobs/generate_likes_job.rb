class GenerateLikesJob < ApplicationJob
  queue_as :default


  def perform(user_id, post_id)
    Like.create(user_id: user_id, post_id: post_id)
  end
end
