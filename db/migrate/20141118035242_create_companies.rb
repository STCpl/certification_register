class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :street
      t.string :email
      t.string :phone_number
      t.string :mobile_number
      t.string :fax_number
      t.integer :state_id

      t.timestamps
    end
  end
end
