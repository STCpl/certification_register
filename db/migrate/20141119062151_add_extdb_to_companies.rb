class AddExtdbToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :extdb, :string
    add_column :people, :extdb, :string
    add_column :incidents, :extdb, :string
  end
end
