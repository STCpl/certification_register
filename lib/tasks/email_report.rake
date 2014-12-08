
namespace :email_report do
	desc "todo"
	
	task :expires_next_month  => :environment do
		Mail.defaults do
		  delivery_method :smtp, { 
	    :address => '192.168.10.6',
	    :port => 25,
	    :enable_starttls_auto => false
	    }
	  end

		managers = Manager.all
  	managers.each do |manager|
  		puts "Finding all certs for #{manager.state.name}"
			certifications = Certification.expires_within_30days.where(state: State.find_by_name(manager.state.name) )			
			send_emails(certifications, manager.person.email)
		end

	end
end


def send_emails(certifications, from_address)	  
	emails = Hash.new
#this variable is a string to just the email co-ordinator
	cordinator_body = "Hello, This is an automated monthly certification expiry check report! \n \n  I've emailed the folling... \n"

	certifications.each do |cert| 
	 	email_address = 
		if emails[cert.person.email].nil?
			emails[cert.person.email] = "Hi #{cert.person.first_name}, \n\n According to our records the following certificates are due to expire on the date listed. \nPlease organise the required refresher training/certificate renewal through your state safety co-ordinator.\n"
		end
		emails[cert.person.email] = "#{emails[cert.person.email]} \n - #{cert.classification.name} | Expires #{cert.expiry_date}"
#add email to co-ordinator email for info		
		cordinator_body = "#{cordinator_body} - #{cert.name} | Expires #{cert.expiry_date}\n"


	end
#email the person
  emails.each do |to_address, email_body|
		#puts email_address 
		puts "#{email_body} \n \n Have a great day!"

	  Mail.deliver do
			from     from_address
			to       to_address
			subject  'Lanskey: Certificates expiring in the next 30 days.'
			body "#{email_body} \n \n Have a great day! \n \n -= This is an automatically generated email brought to you by the loving folks at Lanskey IT.=- "
		end
	end

	#email co-ordinator 
	Mail.deliver do
		from     from_address
		to       from_address
		subject  'Lanskey: Certificates expiring in the next 30 days REPORT'
		body "#{cordinator_body} \n \n Have a great day!"
	end


end

