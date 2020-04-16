class UserPostSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer  
    attributes :id, :post_information, :title, :url, :url_image, :description, :content_body
    belongs_to :post
    belongs_to :user

    def title
      object.post.title
    end

    def url
      object.post.content_url
    end

    def description
      object.post.description
    end

    def url_image
      object.post.url_image
    end

    def content_body
      object.post.content_body
    end



end