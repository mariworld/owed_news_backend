class AddContentbodyToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :content_body, :string
  end
end
