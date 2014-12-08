class Company < ActiveRecord::Base
  has_many :people
  belongs_to :state

  validates :name, presence: true
  validates :state, presence: true

  scope :active, -> { where(active: true) }
  scope :non_active, -> { where(active: false) }

end
