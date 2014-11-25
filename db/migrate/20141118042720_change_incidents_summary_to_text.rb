class ChangeIncidentsSummaryToText < ActiveRecord::Migration
  def change
  	remove_column :people, :fist_name
  	remove_column :people, :last_name
  end
end
