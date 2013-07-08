class GalleriesController < ApplicationController
	def index
		@titles = Title.all
		@celebs = Celeb.all
	end
end