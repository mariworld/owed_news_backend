class User < ApplicationRecord
    has_many :user_posts
    has_many :posts, through: :user_posts
    validates :username, uniqueness: { case_sensitive: false }
    has_secure_password

    # def user_post_titles
    #     self.user_posts.each do |user_post|
    #     user_post.post 
    #     end
    # end

end
