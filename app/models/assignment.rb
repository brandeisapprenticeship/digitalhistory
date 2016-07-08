class Assignment < ActiveRecord::Base
	has_many :extensions
	has_many :presentations
	has_many :path_comments
	has_many :steps
end
