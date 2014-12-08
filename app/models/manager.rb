class Manager < ActiveRecord::Base
	belongs_to :person
  belongs_to :state

  validates :person, presence: true
  validates :state, presence: true


end
