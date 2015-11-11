class Step < ActiveRecord::Base
	mount_uploader :screenshot, ScreenshotUploader
	has_many :step_comments
	belongs_to :user
	belongs_to :assignment
end
