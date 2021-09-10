class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true







  has_many :likes, dependent: :destroy



  belongs_to :user, :optional => true, :class_name => "User",
  :foreign_key => 'user_id'



end
