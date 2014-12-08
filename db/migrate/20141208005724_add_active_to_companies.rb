class AddActiveToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :active, :boolean
    add_index :companies, :active
  end
end
