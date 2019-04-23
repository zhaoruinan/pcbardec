class ChangeDecrecord < ActiveRecord::Migration[5.2]
  def up
  	add_column :decrecords, :body, :string
  end
end
