class Classification < ActiveRecord::Base
	has_many :certifications
	belongs_to :type

	validates :type, presence: true


	after_validation  do |classification|
		if classification.code.to_s == ''
			classification.name = "#{classification.type.name}"
		else
			classification.name = "#{classification.type.name} | #{classification.code}"
		end
  end

end


