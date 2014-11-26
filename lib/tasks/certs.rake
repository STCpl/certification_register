
namespace :certs do
	desc "todo"
	
	task :find_expired  => :environment do
		certs = Certification.between_times(Time.zone.now - 10.years, Time.zone.now, field: :expiry_date)
		certs.update_all( :active => false)
	end


end
