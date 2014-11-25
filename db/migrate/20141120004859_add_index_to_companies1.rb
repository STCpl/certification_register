class AddIndexToCompanies1 < ActiveRecord::Migration
  def change
  	add_index :companies, :name
  	add_index :states, :name
  	add_index :jobs, :name
  	add_index :jobs, :realname
  	add_index :jobs, :code
  	
  end
end
