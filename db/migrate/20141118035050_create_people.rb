class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :fist_name
      t.string :last_name
      t.string :street
      t.string :email
      t.string :phone_number
      t.string :mobile_number
      t.string :fax_number
      t.string :job_title
      t.string :company_id
      t.integer :state_id

      t.timestamps
    end
  end
end
