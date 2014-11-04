class Lawyer < ActiveRecord::Base
	has_many :lawyer_services, :dependent => :destroy
	has_many :services, :through => :lawyer_services

	def self.autocomplete_results(term)
		Lawyer.where("location like '%#{term}%'").collect(&:location).uniq
	end

	def self.search(location, service)
		lawyers_loc = location.present? ? Lawyer.where("location in (?)", location) : Lawyer.where("code is not NULL")
		lawyers_ser = service.present? ? lawyers_loc.joins(:lawyer_services).where("lawyer_services.service_id in (?)", service) : lawyers_loc
	end
end