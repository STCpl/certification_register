class AddOutcomedescripToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :outcome_description, :text
  end
end
