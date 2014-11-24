class Classification < ActiveRecord::Base
	has_many :certifications

	after_validation   do |classification|
		if classification.description.to_s == ''
			classification.name = "#{classification.code}"
		else
			classification.name = "#{classification.code} | #{classification.description}"
		end
  end

	after_validation   do |cert|
    if !cert.classification.to_s == ''
	    cert.name = "#{cert.person.first_name} #{cert.person.last_name} | #{cert.classification.code} | #{cert.description}"
    else
    	cert.name = "#{cert.person.first_name} #{cert.person.last_name} | #{cert.description}"
    end 

  end

end


