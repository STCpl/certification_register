class Job < ActiveRecord::Base
  validates :name, presence: true
  validates :state, presence: true
 
  belongs_to :state
  belongs_to :company

end
