class Certification < ActiveRecord::Base

# readme https://github.com/airblade/paper_trail
  has_paper_trail

	belongs_to :person
	belongs_to :classification
  #belongs_to :type
  #has_many :documents

  mount_uploader :attachment_1, AttachmentUploader
  mount_uploader :attachment_2, AttachmentUploader
  mount_uploader :attachment_3, AttachmentUploader
  mount_uploader :attachment_4, AttachmentUploader

  validates :description, presence: true
  validates :classification, presence: true
  
  scope :active?, -> { where(active: TRUE) }
  scope :non_active?, -> { where(active: FALSE) }
  scope :expires_within_30days, -> { between_times(Time.zone.now, Time.zone.now + 30.days, field: :expiry_date).order("expiry_date") }
  scope :expires_within_60days, -> { between_times(Time.zone.now, Time.zone.now + 60.days, field: :expiry_date).order("expiry_date") }

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
