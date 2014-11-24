class Outcome < ActiveRecord::Base
    has_many :incidents
    validates :name, presence: true
    validates :description, presence: true
end
