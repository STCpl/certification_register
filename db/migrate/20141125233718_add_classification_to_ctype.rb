class AddClassificationToCtype < ActiveRecord::Migration
  def change
    add_column :types, :classification_id, :integer
  end
end
