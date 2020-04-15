class PostSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer
  attributes :id, :caption,:content_url,:title,:description,:url_image,:content_body
  has_many :user_posts
end
