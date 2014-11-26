class AddTypeToClassifications < ActiveRecord::Migration
  def change
    add_column :classifications, :type_id, :integer

    remove_column :certifications, :type_id, :integer    
    remove_column :types, :classification_id, :integer
  end
end
