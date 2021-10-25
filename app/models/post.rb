class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true







  has_many :likes, dependent: :destroy



  belongs_to :user, :optional => true, :class_name => "User",
  :foreign_key => 'user_id'

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags


  scope :all_by_tags, ->(tags) do
      posts = includes(:user)
      if tags
        posts = posts.joins(:tags).where(tags: tags).preload(:tags)
      else
        posts = posts.includes(:post_tags, :tags)
      end
      posts.order(created_at: :desc)
 end





end
