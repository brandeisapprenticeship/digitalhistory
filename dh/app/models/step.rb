class Step < ActiveRecord::Base
	belongs_to :submission
	has_many :step_comments
end
