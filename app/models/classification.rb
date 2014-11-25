class Classification < ActiveRecord::Base
	has_many :certifications

	after_validation  do |classification|
		if classification.description.to_s == ''
			classification.name = "#{classification.code}"
		else
			classification.name = "#{classification.code} | #{classification.description}"
		end
  end

end


