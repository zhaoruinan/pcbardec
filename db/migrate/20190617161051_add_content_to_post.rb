class AddContentToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :content, :content
  end
end
