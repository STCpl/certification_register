class CertificationsController < ApplicationController
	
	def index
		@certifications = Certification.first
	end

	def expires_in_one_month
		@certifications =  Certification.expires_within_30days
	end


end