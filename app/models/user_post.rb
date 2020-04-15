class UserPost < ApplicationRecord
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  # def user_attributes=(user_attributes)
  #   self.user = User.find_or_create_by(username: user_attributes[:username]) unless user_attributes[:username].blank?
  # end

  def post_information
    hash = self.post.attributes.merge(self.attributes)
    hash.delete("post_id")
    hash.delete("user_id")
    hash.delete("created_at")
    hash.delete("updated_at")
  end

  
end
