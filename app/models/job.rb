class Job < ActiveRecord::Base
  has_many :incidents
  validates :name, presence: true
  validates :state, presence: true

  belongs_to :state
  belongs_to :company

end
