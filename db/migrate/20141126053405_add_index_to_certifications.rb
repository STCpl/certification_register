class AddIndexToCertifications < ActiveRecord::Migration
  def change
  	add_index :certifications, :name
  	add_index :certifications, :attain_date
  	add_index :certifications, :expiry_date
  	add_index :certifications, :active
  	
  	add_index :people, :first_name
  	add_index :people, :last_name

  end
end
