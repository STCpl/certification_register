class AddAttachmentToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :attachments, :string
  end
end
