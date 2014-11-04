class Service < ActiveRecord::Base

	def self.autocomplete(term, options)
		Service.where("name like '%#{term}%'")
	end
end