class FavoritesController < ApplicationController
	def index
		@favorites = Step.where(user_id: current_user.id, favorite: true)
	end
end
