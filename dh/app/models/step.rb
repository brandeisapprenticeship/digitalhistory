class Step < ActiveRecord::Base
	has_many :step_comments
	belongs_to :user
	belongs_to :assignment
end
