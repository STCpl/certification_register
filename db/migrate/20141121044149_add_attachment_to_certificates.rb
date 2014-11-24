class AddAttachmentToCertificates < ActiveRecord::Migration
  def change
    add_column :certifications, :attachments, :string, array: true, default: []
  end
end
