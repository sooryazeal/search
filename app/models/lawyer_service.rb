class LawyerService < ActiveRecord::Base
	belongs_to :lawyer
	belongs_to :service
end