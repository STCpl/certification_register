class CertificationsController < ApplicationController
	
	def index
		@certifications = Certification.first
	end

	def expires_in_one_month
		@certifications =  Certification.between_times(Time.zone.now, Time.zone.now + 30.days, field: :expiry_date).order("expiry_date")
	end


end