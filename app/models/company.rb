class Company < ActiveRecord::Base
  has_many :people
  belongs_to :state

  validates :name, presence: true
  validates :state, presence: true

end
