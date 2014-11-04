module ApplicationHelper
	def get_lawyer_rating_class(rating)
		rating > 3.5 ? "success" : rating > 2 ? "warning" : "important"
	end
end
