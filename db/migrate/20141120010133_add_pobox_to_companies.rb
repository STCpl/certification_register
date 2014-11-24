class AddPoboxToCompanies < ActiveRecord::Migration
  def change    
    add_column :companies, :pobox_address, :string
    add_column :companies, :pobox_city, :string
    add_column :companies, :pobox_state, :string
    add_column :companies, :pobox_postcode, :integer
		add_column :companies, :website, :string

  end
end
