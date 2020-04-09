class UpdateForeignKey < ActiveRecord::Migration[6.0]
    def change
      if foreign_key_exists?(:posts, :users)
        remove_foreign_key :posts, :users
      end
    end
end
