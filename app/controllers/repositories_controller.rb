class RepositoriesController < ApplicationController
	def index
		@repos = Repository.all
	end
end