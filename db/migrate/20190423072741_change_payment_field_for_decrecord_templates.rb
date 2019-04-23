class ChangePaymentFieldForDecrecordTemplates < ActiveRecord::Migration[5.2]
  def up
  	add_column :decrecords, :title, :string
  end
end
