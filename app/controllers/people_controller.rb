class PeopleController < ApplicationController
	def create
		user = Person.new(params[:person])
		if user.save
			cookies[:auth_token] = user.auth_token
			render :json => user, :status => 200
		else
			render :json => user.errors, :status => 500
		end
	end
end
