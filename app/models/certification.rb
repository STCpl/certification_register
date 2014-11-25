class Certification < ActiveRecord::Base

# readme https://github.com/airblade/paper_trail
  has_paper_trail

	belongs_to :person
	belongs_to :classification
  #has_many :documents

  mount_uploader :attachment_1, AttachmentUploader
  mount_uploader :attachment_2, AttachmentUploader
  mount_uploader :attachment_3, AttachmentUploader
  mount_uploader :attachment_4, AttachmentUploader

  validates :description, presence: true
  validates :classification, presence: true

  
	after_validation   do |cert|
    if !cert.person.blank?
      if !cert.classification.to_s == ''
  	    cert.name = "#{cert.person.first_name} #{cert.person.last_name} | #{cert.classification.code} | #{cert.description}"
      else
      	cert.name = "#{cert.person.first_name} #{cert.person.last_name} | #{cert.description}"
      end 
    end
  end


  
end
