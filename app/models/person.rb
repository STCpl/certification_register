class Person < ActiveRecord::Base
  has_many :certifications
  belongs_to :company
  belongs_to :state

  #validates :name, presence: true

  after_validation do |person|
    if !person.company.blank?
    	person.name = "#{person.first_name} #{person.last_name} - #{person.company.name}"
    else
    	person.name = "#{person.first_name} #{person.last_name}"
    end
  end


end
