class UserSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer
  attributes :id, :username
  has_many :user_posts

  # def user_post_titles
  #   object.user_posts.each do |user_post|
  #     user_post.post 
  #   end
  # end
end