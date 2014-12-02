class Certification < ActiveRecord::Base

# readme https://github.com/airblade/paper_trail
  has_paper_trail

	belongs_to :person
	belongs_to :classification
  belongs_to :state
  #belongs_to :type
  #has_many :documents

  mount_uploader :attachment_1, AttachmentUploader
  mount_uploader :attachment_2, AttachmentUploader
  mount_uploader :attachment_3, AttachmentUploader
  mount_uploader :attachment_4, AttachmentUploader

  #validates :attain_date, presence: true
  #validates :expiry_date, presence: true

  validates :person, presence: true
  validates :classification, presence: true

  scope :everything, -> { }
  scope :active?, -> { where(active: TRUE).where.not(attain_date: nil).order(attain_date: :asc) }
  scope :non_active?, -> { where(active: FALSE).where.not(attain_date: nil).order(attain_date: :asc) }
  scope :expires_within_30days, -> { where(active: TRUE).where.not(attain_date: nil).between_times(Time.zone.now, Time.zone.now + 30.days, field: :expiry_date).order("state_id ASC", "expiry_date ASC") }
  scope :expires_within_60days, -> { where(active: TRUE).where.not(attain_date: nil).between_times(Time.zone.now, Time.zone.now + 60.days, field: :expiry_date).order("state_id ASC", "expiry_date ASC") }

	after_validation   do |cert|
    if !cert.person.blank?
      if !cert.classification.to_s == ''
  	    cert.name = "#{cert.person.first_name} #{cert.person.last_name} | #{cert.classification.code} | #{cert.description}"
      else
      	cert.name = "#{cert.person.first_name} #{cert.person.last_name} | #{cert.classification.name}"
      end 
    end
    cert.state = person.state
  end


  
end
