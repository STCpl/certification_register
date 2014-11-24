class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :name
      t.string :description
      t.integer :person_id
      t.integer :classification_id
      t.string :number
      t.date :attain_date
      t.date :expiry_date
      t.integer :expiry_prior_notification_days
      t.text :notes
      t.string :extdb

      t.timestamps
    end
  end
end
