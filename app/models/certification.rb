class Certification < ActiveRecord::Base
	belongs_to :person
	belongs_to :classification

  mount_uploader :attachment_1, AttachmentUploader
  mount_uploader :attachment_2, AttachmentUploader
  mount_uploader :attachment_3, AttachmentUploader
  mount_uploader :attachment_4, AttachmentUploader
  
	after_validation   do |cert|
    if !cert.classification.to_s == ''
	    cert.name = "#{cert.person.first_name} #{cert.person.last_name} | #{cert.classification.code} | #{cert.description}"
    else
    	cert.name = "#{cert.person.first_name} #{cert.person.last_name} | #{cert.description}"
    end 

  end


  
end
