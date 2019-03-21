class CreateDecpcbars < ActiveRecord::Migration[5.1][5.2]
  def change
    create_table :decpcbars do |t|
      t.string :name
      t.string :ip_sart
      t.string :ip_num

      t.timestamps
    end
  end
end
