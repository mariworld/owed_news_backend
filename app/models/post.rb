class Post < ApplicationRecord
  # belongs_to :user
  has_many :user_posts, dependent: :destroy
  has_many :users, through: :user_posts, dependent: :destroy
  include HTTParty
  
  def self.response
    HTTParty.get("http://newsapi.org/v2/everything?domains=wsj.com&apiKey=#{ENV['google_api_key']}")
  end
  # puts response.body

  #   def questions
  #     self.class.get("/2.2/questions", @options)
  #   end
  
  #   def users
  #     self.class.get("/2.2/users", @options)
  #   end
  # end



end
