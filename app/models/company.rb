class Company < ActiveRecord::Base
  has_many :incidents
  has_many :people
  has_many :jobs
  belongs_to :state

  validates :name, presence: true
  validates :state, presence: true

end
