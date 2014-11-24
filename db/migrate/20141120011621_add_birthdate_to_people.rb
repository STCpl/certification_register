class AddBirthdateToPeople < ActiveRecord::Migration
  def change
    add_column :people, :birthdate, :date
  end
end
