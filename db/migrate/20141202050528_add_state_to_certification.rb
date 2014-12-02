class AddStateToCertification < ActiveRecord::Migration
  def change
  	    add_column :certifications, :state_id, :integer
  end
end
