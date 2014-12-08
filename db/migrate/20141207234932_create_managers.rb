class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.integer :state_id
      t.integer :person_id

      t.timestamps
    end
  end
end
