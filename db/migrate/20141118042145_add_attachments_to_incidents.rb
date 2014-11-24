class AddAttachmentsToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :attachment_1, :string
    add_column :incidents, :attachment_2, :string
    add_column :incidents, :attachment_3, :string
    add_column :incidents, :attachment_4, :string
    add_column :incidents, :attachment_5, :string
    remove_column :incidents, :attachments, :string
  end
end
