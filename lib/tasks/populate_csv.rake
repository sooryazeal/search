require 'csv'
namespace :migration do
  desc "Populate Lawyer CSV data"
	task :populate_lawyers => :environment do 
	  lawyers = CSV.read(Rails.root.to_s + "/db/data/Lawyers.csv")
	  lawyers.each do |record|
	  	record.collect!{|field| field.try(:strip)}
	  	lawyer = Lawyer.find_or_initialize_by_code(record[0])
	  	lawyer.name = record[1]
	  	lawyer.experience = record[2]
	  	lawyer.location = record[3]
	  	lawyer.rating = record[4]
	  	lawyer.save!
	  end
	end

	desc "Populate Service CSV data"
	task :populate_services => :environment do 
	  services = CSV.read(Rails.root.to_s + "/db/data/Services.csv")
	  services.each do |record|
	  	record.collect!{|field| field.try(:strip)}
	  	service = Service.find_or_initialize_by_code(record[1])
	  	service.name = record[2]
	  	service.save!

	  	lawyer = Lawyer.find_by_code(record[0])

	  	lawyer_service = LawyerService.new
	  	lawyer_service.lawyer_id = lawyer.id
	  	lawyer_service.service_id = service.id
	  	lawyer_service.charges = record[3]
	  	lawyer_service.save!
	  end
	end
end