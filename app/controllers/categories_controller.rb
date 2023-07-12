class CategoriesController < ApplicationController

	def index
		@catgory=Category.all
		render json: @catgory
	end
end
