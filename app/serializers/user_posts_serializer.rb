class UserPostSerializer < ActiveModel::Serializer
    attributes :id, :username
    belongs_to :post
  end