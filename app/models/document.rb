class Document < ActiveRecord::Base
	belongs_to :certification
	mount_uploader :attachment, AttachmentUploader
end
