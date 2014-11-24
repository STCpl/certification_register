class AddAbnToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :abn, :string
  end
end
