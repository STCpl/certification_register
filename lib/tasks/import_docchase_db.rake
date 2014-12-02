
namespace :import_docchase_db do
	desc "todo"
	
	task :people  => :environment do
		s = Roo::Spreadsheet.open("public/import/tblContacts.xls")
		source = s.sheet(0)
#		source.pry
		source.each do |r|
			if r[0] == 'dwContactID' 
				puts 'skipping'
				else
					person = Person.find_or_create_by(extdb: r[0].to_s)
					person.last_name = r[1]
					person.first_name = r[2]
					person.job_title = r[6]
					if !(r[7] == '')
						person.birthdate =  Chronic.parse(r[7])
					end
					person.company = Company.find_or_create_by(extdb: r[4].to_s)					
					person.street = r[11]
					person.city = r[12]
					person.state = State.find_or_create_by(name: r[13].to_s.upcase)
					person.postcode = r[14]
					#r[17] #country
					person.email = r[22]
					person.phone_number = r[25]
					person.mobile_number = r[28]
					person.fax_number = r[29]

					person.save
					puts "#{person.name} - street:#{person.street} - email:#{person.email}"
					#person.save
					#person.pry
				end
		end
	end


	task :companies  => :environment do
		s = Roo::Spreadsheet.open("public/import/tblCompanies.xls")
		source = s.sheet(0)
#		source.pry
		source.each do |r|
			if r[0] == 'dwCompanyID' 
				puts 'skipping'
				else
					company = Company.find_or_create_by(extdb: r[0].to_s)
					company.name = r[2]
					
					company.abn = r[6]					
					company.street = r[8]
					company.city = r[9]
					company.state = State.find_or_create_by(name: r[10].to_s.upcase)
					company.postcode = r[11]
					#r[17] #country
					company.email = r[18]
					company.phone_number = r[21]
					company.mobile_number = r[23]
					company.fax_number = r[24]

					puts "#{company.name} - street:#{company.street} - email:#{company.email}"
					company.save
				end
		end
	end

	task :classifications  => :environment do
		s = Roo::Spreadsheet.open("public/import/tlkpCertClasses.xls")
		source = s.sheet(0)
#		source.pry
		source.each do |r|
			if r[0] == 'CertClass' 
				puts 'skipping'
				else
					#r.pry
					record = c.find_or_create_by(code: r[0].to_s.upcase)
					type = Type.find_or_create_by(name: r[1].to_s)
					#record.code = r[0].to_s.upcase
					#record.name = "#{record.name}"					
					record.save
				end
		end
	end

	task :certifications  => :environment do
		attach_s = Roo::Spreadsheet.open("public/import/tblCertAttachs.xls")
		s = Roo::Spreadsheet.open("public/import/tblCerts.xls")
		source = s.sheet(0)
#		source.pry
		source.each do |r|
			if r[0] == 'CertID' 
				puts 'skipping'
				else
					record = Certification.find_or_create_by(extdb: r[0].to_i)
					if(r[1].downcase == "true") 
					  record.active = 1					
					else
					  record.active  = 0 
					end
					
					record.number = r[4].to_s
					#record.is_active = r[1]
					record.description = r[5].to_s
					record.notes = r[11]

					record.person = Person.find_or_create_by(extdb: r[2].to_i)

					matches = /(.*) - (.*)/.match(r[5].to_s)
					if !matches.nil?
						type_string = matches[1]
						code_string = matches[2]
					else
						type_string = r[5].to_s
						code_string = r[6].to_s
					end

					type = Type.find_or_create_by(name: type_string)
					record.classification = Classification.find_or_create_by(code: code_string, type: type)

					record.attain_date = Chronic.parse(r[7])
					record.expiry_date = Chronic.parse(r[8])
					record.expiry_prior_notification_days = r[9]

					#find attachments
					attach_files = Dir["public/certs/#{r[0].to_i}/*"]
					puts "public/certs/#{r[0].to_i}/*"
					puts "files =  #{attach_files}"
					attach_files.each_with_index {|attach_file, index| 
						puts "ATTACHING - #{attach_file} => #{index}" 
						if index == 0 
							record.attachment_1 = File.open(attach_file)
						elsif index == 1
							record.attachment_2 = File.open(attach_file)
						elsif index == 3 
							record.attachment_3 = File.open(attach_file)
						elsif index == 4
							record.attachment_4 = File.open(attach_file)
						end
					}

					#record.name = "#{record.name}"
					puts record.name
					record.save
				end
		end
	end



	task :jobs  => :environment do
		s = Roo::Spreadsheet.open("public/import/tblJobs.xls")
		source = s.sheet(0)
#		source.pry
		source.each do |r|
			if r[0] == 'dwJobID' 
				puts 'skipping'
				else
					#r.pry
					job = Job.find_or_create_by(extdb: r[0].to_i)
					job.city = r[1]
					job.code = r[7]
					job.realname = r[8] 			
					job.street = r[14]
					job.state = State.find_or_create_by(name: r[15].to_s.upcase )
					job.postcode = r[16]
					#r[17] #country
					job.phone_number = r[18]
					job.mobile_number = r[20]
					job.fax_number = r[21]
					job.notes = r[22]
					#r[23] #active?
					job.start_date = Chronic.parse(r[24])
					job.end_date = Chronic.parse(r[25])

					job.company = Company.find_by(extdb: r[2].to_s)

					job.name = "#{job.code} - #{job.realname} "

					puts job.code
					job.save
				end
		end
	end

	task :incidents  => :environment do
		s = Roo::Spreadsheet.open("public/import/tblHSSEIcd.xls")
		source = s.sheet(0)
#		source.pry
		source.each do |i|
#			i.pry
			incident = Incdient.find_or_create_by(name: i[0], description: i[1])

			incident.date = Chronic.parse(r[1])
			incident.state = State.find_or_create_by(name: r[3].to_s.upcase)
			
			incident.site_location = r[4]
			incident.description = r[9]


			incident.company = Company.find_by(extdb: r[6].to_s)



			
		end		
	end


	task :outcomes  => :environment do
		s = Roo::CSV.new("public/import/tlkpHSSEIcdOutcome.txt")
		source = s.sheet(0)
#		source.pry
		source.each do |i|
#			i.pry
			outcome = Outcome.find_or_create_by(name: i[0], description: i[1])
			puts outcome.name	
		end		
	end


	task :injuries  => :environment do
		s = Roo::CSV.new("public/import/tlkpHSSEIcdInjuryType.txt") 
		source = s.sheet(0)
		#source.pry
		source.each do |i|
			injury = Injury.find_or_create_by(name: i[0])
			puts injury.name	
		end		
	end


	task :report  => :environment do
		report = ODFReport::Report.new("public/reports/tset.odt") do |r|
		  r.add_field :user_name, 'John Hewitt'
		  r.add_field :address, "0284uojf;lasjdlfk;"
		end

		report.generate("public/reports/new_ticket.odt")

	end



	task :cleanup  => :environment do
		certs = Certification.all
		certs.each do |c|
			c.valid?
			c.save
		end

		#delete all old users
		people = Person.all
		people.each do |person| 
			if person.certifications[0].nil? 
				puts "Erasing #{person.name}"
			end
		end
	end


end
