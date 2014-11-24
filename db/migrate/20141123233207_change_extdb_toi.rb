class ChangeExtdbToi < ActiveRecord::Migration
  def change
  	change_column :certifications, :extdb, 'integer USING CAST(extdb AS integer)'
  	change_column :companies, :extdb, 'integer USING CAST(extdb AS integer)'
  	change_column :people, :extdb, 'integer USING CAST(extdb AS integer)'  	
  end  
end
