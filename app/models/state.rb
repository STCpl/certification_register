class State < ActiveRecord::Base
    has_many :incidents
    validates :name, presence: true
end
