class Incident < ActiveRecord::Base
	require 'carrierwave/orm/activerecord'

	has_paper_trail
	
  validates :site_location, presence: true
  validates :summary, presence: true
  validates :date, presence: true
  validates :job, presence: true
  validates :person, presence: true
  #validates :company, presence: true
  #validates :state, presence: true
    
  mount_uploader :attachment_1, AttachmentUploader
  mount_uploader :attachment_2, AttachmentUploader
  mount_uploader :attachment_3, AttachmentUploader
  mount_uploader :attachment_4, AttachmentUploader
  mount_uploader :attachment_5, AttachmentUploader

  belongs_to :job
  belongs_to :person
  belongs_to :company
  belongs_to :state
  belongs_to :injury
  belongs_to :outcome

  after_validation   do |incident|
    incident.name = "#{incident.job.name} - #{incident.person.name}"
    incident.state = incident.job.state
  end

end
