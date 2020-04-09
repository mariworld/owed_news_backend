class Post < ApplicationRecord
  # belongs_to :user
  has_many :user_posts, dependent: :destroy
  has_many :users, through: :user_posts, dependent: :destroy

  # def self.get_post
    
  # end
end
