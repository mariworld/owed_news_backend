class AddUrlimageToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :url_image, :string
  end
end
