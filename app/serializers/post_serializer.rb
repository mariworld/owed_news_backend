class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :content_url
  has_one :user
end
