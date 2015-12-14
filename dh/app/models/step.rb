class Step < ActiveRecord::Base
	include TheSortableTree::Scopes
	acts_as_nested_set
	mount_uploader :screenshot, ScreenshotUploader
	has_many :step_comments
	belongs_to :user
	belongs_to :assignment
	validates :title, :presence => true
end
