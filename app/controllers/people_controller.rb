class PeopleController < ApplicationController
	
	def index
		@people = People.first
	end



end