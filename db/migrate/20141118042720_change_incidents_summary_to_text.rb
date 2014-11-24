class ChangeIncidentsSummaryToText < ActiveRecord::Migration
  def change
  	change_column :incidents, :summary, :text
  	rename_column :incidents, :area, :site_location
  	add_index :incidents, :summary
  	remove_column :people, :fist_name
  	remove_column :people, :last_name
  end
end
