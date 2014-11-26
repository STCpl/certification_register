class ChangeIsActiveToActive < ActiveRecord::Migration
  def change
  	rename_column :certifications, :is_active, :active
  end
end
