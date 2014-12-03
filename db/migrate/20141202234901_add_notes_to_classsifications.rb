class AddNotesToClasssifications < ActiveRecord::Migration
  def change
    add_column :classifications, :notes, :text
    remove_column :classifications, :description
  end
end
