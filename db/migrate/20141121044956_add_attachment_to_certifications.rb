class AddAttachmentToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :attachment_1, :string
    add_column :certifications, :attachment_2, :string
    add_column :certifications, :attachment_3, :string
    add_column :certifications, :attachment_4, :string
  end
end
