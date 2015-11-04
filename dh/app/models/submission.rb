class Submission < ActiveRecord::Base
	has_many :path_comments
	has_many :steps
	belongs_to :assignment
	belongs_to :user, dependent: :destroy
end
