class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :area
      t.string :summary
      t.boolean :is_active
      t.date :date
      t.integer :job_id
      t.integer :outcome_id
      t.integer :state_id
      t.integer :person_id
      t.integer :company_id
      t.integer :injury_id

      t.timestamps
    end
    add_index :incidents, :job_id
    add_index :incidents, :outcome_id
    add_index :incidents, :state_id
    add_index :incidents, :person_id
    add_index :incidents, :company_id
    add_index :incidents, :injury_id
  end
end
