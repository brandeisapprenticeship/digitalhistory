class PathComment < ActiveRecord::Base
	belongs_to :submission
	belongs_to :user
end
