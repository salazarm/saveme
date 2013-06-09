class SessionsController < ApplicationController
	
	def create
   user = Person.find_by_email(params[:email].downcase)
   if user && user.authenticate(params[:password])
     cookie[:auth_token] = user.id
     render :json => user, :only => ["id" ,"name"], :status => 200
   else
     render :json => {:msg => "Invalid Login"}, :status => 404
   end
  end

  def destroy
   cookie[:auth_token] = nil
   render :json => {}, :status => :ok
  end

end
