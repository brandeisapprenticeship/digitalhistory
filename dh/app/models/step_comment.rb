class StepComment < ActiveRecord::Base
	belongs_to :step
	belongs_to :user
end
