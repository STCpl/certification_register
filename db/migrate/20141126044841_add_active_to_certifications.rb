class AddActiveToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :is_active, :boolean
  end
end
