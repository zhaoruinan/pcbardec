class CreateDecrecords < ActiveRecord::Migration[5.1][5.2]
  def change
    create_table :decrecords do |t|
      t.string :time
      t.string :pc_num

      t.timestamps
    end
  end
end
