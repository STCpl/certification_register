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

  validates :attain_date, presence: true
  #validates :expiry_date, presence: true 
  validates :person, presence: true
  validates :classification, presence: true

## make sure all certificates visible are ones where people are active
  default_scope { includes(:person).where(people: {active: true}).references(:person) }

  scope :everything, -> { }
  scope :active?, -> { where(active: TRUE).where.not(attain_date: nil).order(attain_date: :asc) }
  scope :non_active?, -> { where(active: FALSE).where.not(attain_date: nil).order(attain_date: :asc) }
  scope :expires_within_30days, -> { where(active: TRUE).where.not(attain_date: nil).between_times(Time.zone.now, Time.zone.now + 30.days, field: :expiry_date).order(state_id: :asc, expiry_date: :asc) }
  scope :expires_within_60days, -> { where(active: TRUE).where.not(attain_date: nil).between_times(Time.zone.now, Time.zone.now + 60.days, field: :expiry_date).order(state_id: :asc, expiry_date: :asc) }

	after_validation   do |cert|
    if !cert.person.blank?
      if !cert.classification.to_s == ''
  	    cert.name = "#{cert.person.first_name} #{cert.person.last_name} | #{cert.classification.code} | #{cert.description}"
      else
      	cert.name = "#{cert.person.first_name} #{cert.person.last_name} | #{cert.classification.name}"
      end 
      cert.state = person.state
    end    
  end

  after_initialize do
    if new_record?
      self.active = true
      if self.attain_date.blank?
        self.attain_date = Time.zone.now      
      end
      #if self.expiry_date.blank?
      #  self.expiry_date = Time.zone.now + 99.years
      #end
    end
  end

  
end
