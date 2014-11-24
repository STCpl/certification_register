class AddAddressToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :code, :string
    add_column :jobs, :realname, :string
    add_column :jobs, :street, :string
    add_column :jobs, :city, :string
    add_column :jobs, :phone_number, :string
    add_column :jobs, :mobile_number, :string
    add_column :jobs, :fax_number, :string
    add_column :jobs, :notes, :text
    add_column :jobs, :postcode, :integer
    add_column :jobs, :start_date, :date
    add_column :jobs, :end_date, :date
    add_column :jobs, :company_id, :integer
    add_column :jobs, :extdb, :string

    add_column :people, :city, :string
    add_column :people, :postcode, :integer

    add_column :companies, :city, :string
    add_column :companies, :postcode, :integer
  end
end
