class AddNameToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :name, :string
  end
end
