class AddTestToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :test, :var
  end
end
